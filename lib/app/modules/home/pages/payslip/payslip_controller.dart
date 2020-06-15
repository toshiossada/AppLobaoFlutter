import 'package:mobx/mobx.dart';
import 'package:projeto_lobao/app/shared/model/month_model.dart';
import 'package:projeto_lobao/app/shared/model/payment_model.dart';
import 'package:projeto_lobao/app/shared/services/interfaces/payslip_service_interface.dart';

part 'payslip_controller.g.dart';

class PayslipController = _PayslipBase with _$PayslipController;

abstract class _PayslipBase with Store {
  IPayslipService _payslipService;

  _PayslipBase({IPayslipService payslipService}) {
    _payslipService = payslipService;
  }

  @observable
  MonthModel selectedMonth;
  @observable
  PaymentModel selectedPayment;
  @observable
  ObservableList<MonthModel> months;
  @observable
  ObservableList<PaymentModel> payment;
  @observable
  bool loading = false;

  @action
  setSelectedMonth(v) {
    selectedMonth = v;
  }

  @action
  setLoading(v) {
    loading = v;
  }

  @action
  setSelectedPayment(v) {
    selectedPayment = v;
  }

  @action
  getMonth() async {
    var list = await _payslipService.getMonth();
    months = list.asObservable();
    if (list.isNotEmpty) selectedMonth = list.first;
  }

  @action
  getPayments() async {
    var list = await _payslipService.getPayment();
    payment = list.asObservable();
    if (list.isNotEmpty) selectedPayment = list.first;
  }

  @action
  downloadPdf() async {
    try {
      loading = true;
      return await _payslipService.downloadPdf(selectedMonth, selectedPayment);
    } catch (e) {} finally {
      loading = false;
    }
  }
}
