import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_lobao/app/shared/model/user_model.dart';
import 'package:projeto_lobao/app/shared/repositories/local_storage/interfaces/user_local_storage_repository_repository_interface.dart';

import 'interfaces/user_storage_service_interface.dart';

class UserStorageService extends Disposable implements IUserStorageService {
  final IUserLocalStorageRepository userLocalStorageRepositoryRepository;
  UserStorageService({this.userLocalStorageRepositoryRepository});

  Future<List<UserModel>> getAll() async {
    return await userLocalStorageRepositoryRepository.getAll();
  }

  Future<int> count() async {
    return await userLocalStorageRepositoryRepository.count();
  }

  Future<UserModel> get(int id) async {
    return await userLocalStorageRepositoryRepository.get(id);
  }

  Future<UserModel> add(UserModel model) async {
    return await userLocalStorageRepositoryRepository.add(model);
  }

  update(UserModel model) async {
    await userLocalStorageRepositoryRepository.update(model);
  }

  remove(String username) async {
    await userLocalStorageRepositoryRepository.remove(username);
  }

  clear() async {
    await userLocalStorageRepositoryRepository.clear();
  }

  @override
  void dispose() {}
}
