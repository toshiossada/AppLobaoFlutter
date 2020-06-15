import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:open_file/open_file.dart';
import 'package:projeto_lobao/app/modules/home/pages/login/components/circular_button/circular_button_widget.dart';
import 'package:projeto_lobao/app/modules/home/pages/login/login_controller.dart';
import 'package:projeto_lobao/app/modules/home/pages/payslip/payslip_controller.dart';
import 'package:projeto_lobao/app/modules/home/shared/components/loading/loading_widget.dart';
import 'package:projeto_lobao/app/modules/home/shared/components/master/master_widget.dart';

class PayslipPage extends StatefulWidget {
  final String title;
  const PayslipPage({Key key, this.title = "Payslip"}) : super(key: key);

  @override
  _PayslipPageState createState() => _PayslipPageState();
}

class _PayslipPageState extends State<PayslipPage> {
  final LoginController _loginController = Modular.get();
  final PayslipController _controller = Modular.get();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    _controller.getMonth();
    _controller.getPayments();
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      title: '${_loginController.user.name},',
      subTitle: 'você selecionou holerites:',
      scaffoldKey: _scaffoldKey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Observer(
              builder: (_) {
                return _controller.months == null
                    ? LoadingWidget()
                    : DropdownButton(
                        items: _controller.months.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: new Text(
                              '${value.monthFormated()}/${value.year}',
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                        underline: Text(''),
                        iconEnabledColor: Colors.black,
                        value: _controller.selectedMonth,
                        style: TextStyle(color: Colors.grey),
                        isExpanded: true,
                        onChanged: _controller.setSelectedMonth,
                      );
              },
            ),
            Container(color: Colors.grey, height: 2),
            Observer(
              builder: (_) {
                return _controller.payment == null
                    ? LoadingWidget()
                    : DropdownButton(
                        items: _controller.payment.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: new Text(
                              value.description,
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                        underline: Text(''),
                        iconEnabledColor: Colors.black,
                        value: _controller.selectedPayment,
                        style: TextStyle(color: Colors.grey),
                        isExpanded: true,
                        onChanged: _controller.setSelectedPayment,
                      );
              },
            ),
            Container(color: Colors.grey, height: 2),
            SizedBox(height: 10),
            Container(
              child: Observer(
                builder: (_) => _controller.loading ?? false
                    ? LoadingWidget()
                    : CircularButtonWidget(
                        width: MediaQuery.of(context).size.width - 100,
                        backgroundColor: Colors.blue[800],
                        label: "Consultar",
                        icon: Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                        onTap: () async {
                          try {
                            var file = await _controller.downloadPdf();
                            OpenFile.open(file, type: "application/pdf");
                          } catch (e) {
                            onError();
                          } finally {
                            _controller.setLoading(false);
                          }
                        },
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }

  onError() {
    _controller.setLoading(true);

    final snackBar = SnackBar(
      content: Text('Erro ao tentar gerar holerite'),
      backgroundColor: Colors.red,
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
