import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_lobao/app/shared/model/month_model.dart';
import 'package:projeto_lobao/app/shared/model/payment_model.dart';
import 'package:projeto_lobao/app/shared/repositories/interfaces/payslip_repository_interface.dart';

import 'interfaces/payslip_service_interface.dart';

class PayslipService extends Disposable implements IPayslipService {
  IPayslipRepository repository;

  PayslipService({this.repository});

  @override
  void dispose() {}

  @override
  Future<List<MonthModel>> getMonth() async {
    return await repository.getMonth();
  }

  @override
  Future<List<PaymentModel>> getPayment() async {
    return await repository.getPayment();
  }

  @override
  Future<String> downloadPdf(MonthModel month, PaymentModel payment) async {
    return await repository.downloadPdf(month, payment);
  }
}
