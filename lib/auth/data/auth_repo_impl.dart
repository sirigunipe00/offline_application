import 'dart:convert';

import 'package:offline_first/auth/data/auth_repo.dart';
import 'package:offline_first/auth/model/logged_in_user.dart';
import 'package:offline_first/core/core.dart';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';


@LazySingleton(as: AuthRepo)
class AuthRepoImpl extends BaseApiRepository implements AuthRepo {
  const AuthRepoImpl(super.client, this.storage);

  final KeyValueStorage storage;

  @override
  Future<bool> isLoggedIn() async {
    try {
      final user = await storage.getSecureString(LocalKeys.user);
      return (user.containsValidValue && json.decode(user!) is Map);
    } on Exception catch (e, st) {
      $logger.error('[repo] could not check for persisted user', e, st);
      return false;
    }
  }

  @override
  AsyncValueOf<LoggedInUser> logIn(String username, String pswd) async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
        url: Urls.getUsers,
        parser: (res) {
          // final data = res['message']['data'] as List<dynamic>;
          final message = res['message'];

          if (message == null) {
            throw Exception('Missing message in response');
          }

          final data = message['data'];

          if (data is List && data.isNotEmpty) {
            return LoggedInUser.fromJson(data.first);
          } else if (data is Map<String, dynamic>) {


            return LoggedInUser.fromJson(data);
          } else {
            throw Exception('Unexpected data format in login response: $data');
          }

          // return LoggedInUser.fromJson(data.first);
        },
        body: jsonEncode({'usr': username, 'pwd': pswd}),
      );

      final response = await post(requestConfig, includeAuthHeader: false);

      return response.processAsync((r) async {
        if (r.data.isNull) {
          return Errors.invalidUser.asFailure();
        }
        final userWithPswd = r.data!.copyWith(password: pswd);
        await _persistUser(userWithPswd);
        await storage.setString(LocalKeys.apiKey, userWithPswd.apiKey);
        await storage.setString(LocalKeys.apiSecret, userWithPswd.apiSecret);

        return right(userWithPswd);
      });
    });
  }

  Future<Either<Failure, bool>> _persistUser(LoggedInUser user) async {
    try {
      final userJson = jsonEncode(user.toJson());
      await storage.setSecureString(LocalKeys.user, userJson);

      return right(true);
    } on Exception catch (e, st) {
      $logger.error('[repo] could not persisted user', e, st);
      return left(const Failure(error: 'Something went wrong'));
    }
  }

  @override
  AsyncValueOf<LoggedInUser> getPersistedUser() async {
    try {
      final userSource = await storage.getSecureString(LocalKeys.user);
      if (userSource.doesNotHaveValue) {
        return left(const Failure(error: 'No user details found'));
      }
      final userData = jsonDecode(userSource!) as Map<String, dynamic>;
      final user = LoggedInUser.fromJson(userData);
      return right(user);
    } on Exception catch (e, st) {
      $logger.error('[repo] could not get persisted user', e, st);
      return left(const Failure(error: 'Something went wrong'));
    }
  }

  @override
  AsyncValueOf<bool> signOut() async {
    try {
      await storage.clearAllValues();
      await storage.clearAllSecureValues();
      return right(true);
    } on Exception catch (e, st) {
      $logger.error('[repo] could not sign out user', e, st);
      return left(const Failure(error: 'Could not sign out'));
    }
  }
}
