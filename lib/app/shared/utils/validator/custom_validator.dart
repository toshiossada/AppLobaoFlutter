import 'dart:async';

class CustomValidators {
  static isEmail(String value) {
    RegExp regex =
        new RegExp(r"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$");
    if (!regex.hasMatch(value)) return 'E-mail inválido';
    if (value.isEmpty) {
      return 'E-mail inválido';
    }
    return null;
  }

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) async {
      if (RegExp(r"^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email))
        sink.add(email);
      else
        sink.addError('Insira um email valido');
    },
  );
}
