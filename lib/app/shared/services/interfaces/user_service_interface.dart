import 'package:projeto_lobao/app/shared/model/authentication_model.dart';
import 'package:projeto_lobao/app/shared/model/user_model.dart';

abstract class IUserService {
  Future<UserModel> authenticate({AuthenticationModel model});
  Future<UserModel> getCurrentUser();
  logout();
}
