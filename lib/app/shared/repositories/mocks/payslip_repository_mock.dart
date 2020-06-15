import 'package:projeto_lobao/app/shared/model/month_model.dart';
import 'package:projeto_lobao/app/shared/model/payment_model.dart';
import 'package:mockito/mockito.dart';
import 'package:projeto_lobao/app/shared/repositories/interfaces/payslip_repository_interface.dart';
import 'package:projeto_lobao/app/shared/utils/utils.dart';

class PayslipRepositoryMock extends Mock implements IPayslipRepository {
  @override
  Future<String> downloadPdf(MonthModel month, PaymentModel payment) async {
    return 'C:/teste';
  }

  @override
  Future<List<MonthModel>> getMonth() async {
    final json = await Utils.loadJsonAsset('months');
    var result =
        json.map<MonthModel>((json) => MonthModel.fromJson(json)).toList();

    return result;
  }

  @override
  Future<List<PaymentModel>> getPayment() async {
    final json = await Utils.loadJsonAsset('payroll');
    var result =
        json.map<PaymentModel>((json) => PaymentModel.fromJson(json)).toList();

    return result;
  }
}
