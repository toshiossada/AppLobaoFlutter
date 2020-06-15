import 'package:projeto_lobao/app/shared/model/authentication_model.dart';
import 'package:projeto_lobao/app/shared/model/user_model.dart';

abstract class IUserRepository {
  Future<UserModel> authenticate({AuthenticationModel model});
}
