import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_lobao/app/app_module.dart';

import 'package:projeto_lobao/app/modules/home/pages/payslip/payslip_controller.dart';
import 'package:projeto_lobao/app/modules/home/home_module.dart';
import 'package:projeto_lobao/app/shared/repositories/interfaces/payslip_repository_interface.dart';
import 'package:projeto_lobao/app/shared/repositories/mocks/payslip_repository_mock.dart';

void main() {
  PayslipController _payslipController;

  setUp(() {
    initModule(AppModule(), changeBinds: [
      Bind<IPayslipRepository>((i) => PayslipRepositoryMock()),
    ]);
    initModule(HomeModule());

    _payslipController = HomeModule.to.get<PayslipController>();
  });

  group('PayslipController Test', () {
    test("Get list of months", () async {
      await _payslipController.getMonth();
      expect(_payslipController.months.length, 2);
      expect(_payslipController.selectedMonth, isNotNull);
    });

    test("Get list of payroll", () async {
      await _payslipController.getPayments();
      expect(_payslipController.payment.length, 2);
      expect(_payslipController.selectedPayment, isNotNull);
    });
  });
}
