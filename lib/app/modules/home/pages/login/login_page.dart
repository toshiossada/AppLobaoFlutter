import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_lobao/app/modules/home/pages/login/login_controller.dart';
import 'package:projeto_lobao/app/modules/home/shared/components/loading/loading_widget.dart';
import 'package:projeto_lobao/app/modules/home/shared/components/master/master_widget.dart';

import 'components/login_button/login_button_widget.dart';
import 'components/password_field/password_field_widget.dart';
import 'components/rounded_text_field/rounded_text_field_widget.dart';

class LoginPage extends StatefulWidget {
  final String title;
  LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _controller = Modular.get();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  initState() {
    super.initState();

    verifyLoggedIn();
  }

  verifyLoggedIn() async {
    await _controller.getUser();

    if (_controller.hasUser) Modular.to.pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      scaffoldKey: _scaffoldKey,
      title: 'Bem Vindo!',
      subTitle: 'Insira seus dados para continuar.',
      body: Observer(
        builder: (_) {
          if (_controller.user == null) return LoadingWidget();

          return Column(
            children: <Widget>[
              RoundedTextFieldWidget(
                showBorder: true,
                labelText: 'Email',
                fontColor: Colors.black,
                backgroundColor: Colors.white,
                labelStyleColor: Colors.blue,
                onChanged: _controller.setLogin,
                validator: (value) {
                  if (value.isEmpty)
                    return 'Usuário Inválido';
                  else
                    return null;
                },
              ),
              PasswordFieldWidget(
                showBorder: true,
                onChanged: _controller.setPassword,
                fontColor: Colors.black,
                backgroundColor: Colors.white,
                labelStyleColor: Colors.blue,
                validator: (value) {
                  if (value.isEmpty)
                    return 'Senha Inválido';
                  else
                    return null;
                },
                label: 'Senha',
              ),
              SizedBox(height: 30),
              LoginButtonWidget(
                onError: () {
                  final snackBar = SnackBar(
                    content: Text('Usuário ou senha invalidos'),
                    backgroundColor: Colors.red,
                  );
                  _scaffoldKey.currentState.showSnackBar(snackBar);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
