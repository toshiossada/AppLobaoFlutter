import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_lobao/app/shared/model/authentication_model.dart';
import 'package:projeto_lobao/app/shared/model/user_model.dart';
import 'package:projeto_lobao/app/shared/repositories/interfaces/user_respository_interface.dart';

import 'interfaces/user_service_interface.dart';
import 'interfaces/user_storage_service_interface.dart';

class UserService extends Disposable implements IUserService {
  final IUserRepository userRepository;
  final IUserStorageService storage;

  UserService({this.userRepository, this.storage});

  Future<UserModel> authenticate({AuthenticationModel model}) async {
    var res = await userRepository.authenticate(model: model);

    var count = await storage.count();
    if (count > 0) await storage.clear();
    await storage.add(res);

    return res;
  }

  Future<UserModel> getCurrentUser() async {
    var count = await storage.count();
    if (count > 0) {
      var user = await storage.getAll();
      return user.first;
    }

    return null;
  }

  logout() async {
    await storage.clear();
  }

  @override
  dispose() {}
}
