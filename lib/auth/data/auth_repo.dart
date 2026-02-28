

import 'package:offline_first/auth/model/logged_in_user.dart';
import 'package:offline_first/core/utils/typedefs.dart';


abstract interface class AuthRepo {
  Future<bool> isLoggedIn();
  AsyncValueOf<LoggedInUser> logIn(String username,String pswd);
  AsyncValueOf<LoggedInUser> getPersistedUser();
  AsyncValueOf<bool> signOut();
}
