import 'package:mobx/mobx.dart';
import 'package:projeto_lobao/app/shared/model/authentication_model.dart';
import 'package:projeto_lobao/app/shared/model/user_model.dart';
import 'package:projeto_lobao/app/shared/services/interfaces/user_service_interface.dart';

part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {
  IUserService _userService;

  _LoginBase({IUserService userService}) {
    user = null;
    _userService = userService;
  }

  @observable
  UserModel user;
  @observable
  String email;
  @observable
  String password;
  @computed
  bool get hasUser => (user?.userName ?? '').isNotEmpty;

  AuthenticationModel getAuthentication() =>
      AuthenticationModel(login: email, password: password);

  @action
  authentication({AuthenticationModel authentication}) async {
    try {
      user = await _userService.authenticate(model: authentication);
    } catch (e) {
      user = UserModel();
    }
  }

  @action
  logOut() async {
    user = await _userService.logout();
    user = UserModel();
  }

  @action
  getUser() async {
    try {
      user = await _userService.getCurrentUser() ?? UserModel();
    } catch (e) {
      user = UserModel();
    }
  }

  @observable
  bool loading = false;

  @action
  void setLoading(bool v) => loading = v;

  @action
  void setLogin(String v) => user.userName = v;
  @action
  void setPassword(String v) => user.userName = v;
}
