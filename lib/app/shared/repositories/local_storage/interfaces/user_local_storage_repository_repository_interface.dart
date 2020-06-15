import 'package:projeto_lobao/app/shared/model/user_model.dart';

abstract class IUserLocalStorageRepository {
  Future<List<UserModel>> getAll();
  Future<UserModel> get(int id);
  Future<int> count();
  Future<UserModel> add(UserModel model);
  update(UserModel model);
  remove(String userName);
  clear();
}
