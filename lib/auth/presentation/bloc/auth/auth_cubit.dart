
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_first/auth/data/auth_repo.dart';
import 'package:offline_first/auth/model/logged_in_user.dart';
import 'package:offline_first/core/cubit/base/base_cubit.dart';
import 'package:offline_first/core/di/injector.dart';
import 'package:offline_first/core/logger/app_logger.dart';


part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends AppBaseCubit<AuthState> {
  AuthCubit(this.repo) : super(const AuthState.loading());

  final AuthRepo repo;

  void authCheckRequested() async {
    emitSafeState(const _Loading());
    try {  
      final isloggedIn = await repo.isLoggedIn();
      if (!isloggedIn) {
        emitSafeState(const _UnAuthenticated());
        return;
      }

      final user = await repo.getPersistedUser();

      
      user.fold(
        (l) => emitSafeState(const _UnAuthenticated()),
        (r) async {
          // await OneSignal.User.pushSubscription.optIn();
          await register<LoggedInUser>(r);

       
          emitSafeState(const _Authenticated());
        },
      );
    } on Exception catch (e,st) {
      $logger.error('[AuthCheck Exception]',e,st);
      emitSafeState(const _UnAuthenticated()); 
    }
  }

  void signOut() async {
    try {
      emitSafeState(const _Loading());
      await repo.signOut();
      await $sl.unregister<LoggedInUser>();
      emitSafeState(const _UnAuthenticated());
    } on Exception catch (e,st) {
      $logger.error('[Auth Cubit] cant able to logout', e,st);
      emitSafeState(const _UnAuthenticated());
    }
  }
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated() = _Authenticated;
  const factory AuthState.unAuthenticated() = _UnAuthenticated;
}
