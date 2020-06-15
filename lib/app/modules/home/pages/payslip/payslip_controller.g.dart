// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payslip_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PayslipController on _PayslipBase, Store {
  final _$selectedMonthAtom = Atom(name: '_PayslipBase.selectedMonth');

  @override
  MonthModel get selectedMonth {
    _$selectedMonthAtom.reportRead();
    return super.selectedMonth;
  }

  @override
  set selectedMonth(MonthModel value) {
    _$selectedMonthAtom.reportWrite(value, super.selectedMonth, () {
      super.selectedMonth = value;
    });
  }

  final _$selectedPaymentAtom = Atom(name: '_PayslipBase.selectedPayment');

  @override
  PaymentModel get selectedPayment {
    _$selectedPaymentAtom.reportRead();
    return super.selectedPayment;
  }

  @override
  set selectedPayment(PaymentModel value) {
    _$selectedPaymentAtom.reportWrite(value, super.selectedPayment, () {
      super.selectedPayment = value;
    });
  }

  final _$monthsAtom = Atom(name: '_PayslipBase.months');

  @override
  ObservableList<MonthModel> get months {
    _$monthsAtom.reportRead();
    return super.months;
  }

  @override
  set months(ObservableList<MonthModel> value) {
    _$monthsAtom.reportWrite(value, super.months, () {
      super.months = value;
    });
  }

  final _$paymentAtom = Atom(name: '_PayslipBase.payment');

  @override
  ObservableList<PaymentModel> get payment {
    _$paymentAtom.reportRead();
    return super.payment;
  }

  @override
  set payment(ObservableList<PaymentModel> value) {
    _$paymentAtom.reportWrite(value, super.payment, () {
      super.payment = value;
    });
  }

  final _$loadingAtom = Atom(name: '_PayslipBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$getMonthAsyncAction = AsyncAction('_PayslipBase.getMonth');

  @override
  Future getMonth() {
    return _$getMonthAsyncAction.run(() => super.getMonth());
  }

  final _$getPaymentsAsyncAction = AsyncAction('_PayslipBase.getPayments');

  @override
  Future getPayments() {
    return _$getPaymentsAsyncAction.run(() => super.getPayments());
  }

  final _$downloadPdfAsyncAction = AsyncAction('_PayslipBase.downloadPdf');

  @override
  Future downloadPdf() {
    return _$downloadPdfAsyncAction.run(() => super.downloadPdf());
  }

  final _$_PayslipBaseActionController = ActionController(name: '_PayslipBase');

  @override
  dynamic setSelectedMonth(dynamic v) {
    final _$actionInfo = _$_PayslipBaseActionController.startAction(
        name: '_PayslipBase.setSelectedMonth');
    try {
      return super.setSelectedMonth(v);
    } finally {
      _$_PayslipBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(dynamic v) {
    final _$actionInfo = _$_PayslipBaseActionController.startAction(
        name: '_PayslipBase.setLoading');
    try {
      return super.setLoading(v);
    } finally {
      _$_PayslipBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedPayment(dynamic v) {
    final _$actionInfo = _$_PayslipBaseActionController.startAction(
        name: '_PayslipBase.setSelectedPayment');
    try {
      return super.setSelectedPayment(v);
    } finally {
      _$_PayslipBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedMonth: $selectedMonth,
selectedPayment: $selectedPayment,
months: $months,
payment: $payment,
loading: $loading
    ''';
  }
}
