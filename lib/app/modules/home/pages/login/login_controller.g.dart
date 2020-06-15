// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginBase, Store {
  Computed<bool> _$hasUserComputed;

  @override
  bool get hasUser => (_$hasUserComputed ??=
          Computed<bool>(() => super.hasUser, name: '_LoginBase.hasUser'))
      .value;

  final _$userAtom = Atom(name: '_LoginBase.user');

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$emailAtom = Atom(name: '_LoginBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$loadingAtom = Atom(name: '_LoginBase.loading');

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

  final _$authenticationAsyncAction = AsyncAction('_LoginBase.authentication');

  @override
  Future authentication({AuthenticationModel authentication}) {
    return _$authenticationAsyncAction
        .run(() => super.authentication(authentication: authentication));
  }

  final _$logOutAsyncAction = AsyncAction('_LoginBase.logOut');

  @override
  Future logOut() {
    return _$logOutAsyncAction.run(() => super.logOut());
  }

  final _$getUserAsyncAction = AsyncAction('_LoginBase.getUser');

  @override
  Future getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$_LoginBaseActionController = ActionController(name: '_LoginBase');

  @override
  void setLoading(bool v) {
    final _$actionInfo =
        _$_LoginBaseActionController.startAction(name: '_LoginBase.setLoading');
    try {
      return super.setLoading(v);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLogin(String v) {
    final _$actionInfo =
        _$_LoginBaseActionController.startAction(name: '_LoginBase.setLogin');
    try {
      return super.setLogin(v);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String v) {
    final _$actionInfo = _$_LoginBaseActionController.startAction(
        name: '_LoginBase.setPassword');
    try {
      return super.setPassword(v);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: $user,
email: $email,
password: $password,
loading: $loading,
hasUser: $hasUser
    ''';
  }
}
