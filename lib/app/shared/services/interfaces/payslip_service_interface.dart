import 'package:projeto_lobao/app/shared/model/month_model.dart';
import 'package:projeto_lobao/app/shared/model/payment_model.dart';

abstract class IPayslipService {
  Future<List<MonthModel>> getMonth();
  Future<List<PaymentModel>> getPayment();
  Future<String> downloadPdf(MonthModel month, PaymentModel payment);
}
