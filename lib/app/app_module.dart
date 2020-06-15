import 'package:projeto_lobao/app/shared/repositories/payslip_repository.dart';
import 'package:projeto_lobao/app/shared/services/payslip_service.dart';
import 'package:projeto_lobao/app/shared/repositories/user_repository.dart';
import 'package:projeto_lobao/app/shared/services/user_service.dart';
import 'package:projeto_lobao/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:projeto_lobao/app/app_widget.dart';
import 'package:projeto_lobao/app/modules/home/home_module.dart';

import 'shared/custom_dio/custom_dio.dart';
import 'shared/repositories/interfaces/payslip_repository_interface.dart';
import 'shared/repositories/interfaces/user_respository_interface.dart';
import 'shared/repositories/local_storage/interfaces/user_local_storage_repository_repository_interface.dart';
import 'shared/repositories/local_storage/user_local_storage_repository.dart';
import 'shared/services/interfaces/payslip_service_interface.dart';
import 'shared/services/interfaces/user_service_interface.dart';
import 'shared/services/interfaces/user_storage_service_interface.dart';
import 'shared/services/user_storage_service.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<IPayslipRepository>(
            (i) => PayslipRepository(dio: i.get<CustomDio>())),
        Bind<IPayslipService>(
            (i) => PayslipService(repository: i.get<IPayslipRepository>())),
        Bind<IUserRepository>((i) => UserRepository(dio: i.get<CustomDio>())),
        Bind<IUserLocalStorageRepository>((i) => UserLocalStorageRepository()),
        Bind<IUserService>((i) => UserService(
              userRepository: i.get<IUserRepository>(),
              storage: i.get<IUserStorageService>(),
            )),
        Bind<IUserStorageService>((i) => UserStorageService(
            userLocalStorageRepositoryRepository:
                i.get<IUserLocalStorageRepository>())),
        Bind((i) => AppController()),
        Bind((i) => CustomDio()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
