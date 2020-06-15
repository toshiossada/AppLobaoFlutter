import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';

import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:projeto_lobao/app/shared/model/user_model.dart';

import 'interfaces/user_local_storage_repository_repository_interface.dart';

class UserLocalStorageRepository extends Disposable
    implements IUserLocalStorageRepository {
  var completer = Completer<Box>();

  @override
  Future<void> dispose() async {
    final box = await completer.future;
    box.close();
  }

  UserLocalStorageRepository() {
    _initDb();
  }

  _initDb() async {
    final directory = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    final box = await Hive.openBox('current_user');
    if (!completer.isCompleted) completer.complete(box);
  }

  Future<List<UserModel>> getAll() async {
    final box = await completer.future;

    return box.values
        .map((item) => UserModel.fromJson(Map<String, dynamic>.from(item)))
        .toList();
  }

  Future<int> count() async {
    final box = await completer.future;
    return box.values.length;
  }

  Future<UserModel> get(int id) async {
    final box = await completer.future;
    return UserModel.fromJson(box.get(id));
  }

  Future<UserModel> add(UserModel model) async {
    final box = await completer.future;
    await box.put(model.userName, model.toJson());

    return model;
  }

  update(UserModel model) async {
    final box = await completer.future;
    box.put(model.userName, model.toJson());
  }

  remove(String userName) async {
    final box = await completer.future;
    await box.delete(userName);
  }

  clear() async {
    final box = await completer.future;
    await box.clear();
  }
}
