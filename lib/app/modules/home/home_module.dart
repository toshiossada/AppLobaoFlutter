import 'package:projeto_lobao/app/modules/home/pages/payslip/payslip_controller.dart';
import 'package:projeto_lobao/app/modules/home/pages/login/components/password_field/password_field_controller.dart';
import 'package:projeto_lobao/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_lobao/app/modules/home/home_page.dart';
import 'package:projeto_lobao/app/modules/home/pages/login/login_page.dart';
import 'package:projeto_lobao/app/modules/home/pages/payslip/payslip_page.dart';
import 'package:projeto_lobao/app/shared/services/interfaces/payslip_service_interface.dart';
import 'package:projeto_lobao/app/shared/services/user_service.dart';

import 'pages/login/login_controller.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) =>
            PayslipController(payslipService: Modular.get<IPayslipService>())),
        Bind((i) => PasswordFieldController()),
        Bind((i) => HomeController()),
        Bind((i) => LoginController(userService: Modular.get<UserService>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => LoginPage()),
        Router('/home', child: (_, args) => HomePage()),
        Router('/payslip', child: (_, args) => PayslipPage()),  
      ];

  static Inject get to => Inject<HomeModule>.of();
}
