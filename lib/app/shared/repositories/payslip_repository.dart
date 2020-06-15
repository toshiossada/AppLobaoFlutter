import 'dart:io';

import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:path_provider/path_provider.dart';
import 'package:projeto_lobao/app/shared/model/month_model.dart';
import 'package:projeto_lobao/app/shared/model/payment_model.dart';

import 'interfaces/payslip_repository_interface.dart';

class PayslipRepository extends Disposable implements IPayslipRepository {
  final DioForNative dio;
  final String controllerName = '/payslip';
  PayslipRepository({this.dio});
  @override
  void dispose() {}

  @override
  Future<List<MonthModel>> getMonth() async {
    var months = [
      MonthModel(id: 1, month: 1, year: 2020),
      MonthModel(id: 2, month: 2, year: 2020),
    ];
    return months;
  }

  @override
  Future<List<PaymentModel>> getPayment() async {
    var payments = [
      PaymentModel(id: 1, description: '01 - Pagamento mensal'),
      PaymentModel(id: 2, description: '02 - Pagamento anual'),
    ];
    return payments;
  }

  Future<String> downloadPdf(MonthModel month, PaymentModel payment) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = '${appDocDir.path}/holerite.pdf';
    await dio.download(
      'http://www.rrsantos.com.br/holerite/holerite.pdf',
      appDocPath,
      onReceiveProgress: _showDownloadProgress,
      deleteOnError: true,
    );

    return appDocPath;
  }

  void _showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }
}
