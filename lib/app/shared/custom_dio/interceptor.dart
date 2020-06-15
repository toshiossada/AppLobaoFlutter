import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_lobao/app/shared/model/authentication_model.dart';
import 'package:projeto_lobao/app/shared/services/user_service.dart';

import 'custom_dio.dart';

class CustomInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    UserService userService = Modular.get();
    CustomDio dio = Modular.get();
    var user = await userService.getCurrentUser();
    if (user != null) {
      if (options.headers['Authorization'] == null) {
        dio.lock();

        options.headers.addAll({"Authorization": 'Bearer ${user.accessToken}'});

        dio.unlock();
      }
    }
    print(
        'URL ${options.baseUrl} - Request[${options.method}] => PATH: ${options.path} : ');
    if (options.data != null) print(options.data.toJson());
    print('Authorization: ${options.headers['Authorization']}');

    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print('Response[${response.statusCode}] => PATH: ${response.request.path}');


    return super.onResponse(response);
  }

  @override
  Future onError(DioError e) async {
    //print('Response[${e.response.statusCode}] => PATH: ${e.request.path}');
    UserService userService = Modular.get();
    var user = await userService.getCurrentUser();

    if (user != null && e.response.statusCode == 401) {
      CustomDio dio = Modular.get();

      var options = e.response.request;

      if (user.accessToken == options.headers['Authorization']) {
        options.headers['Authorization'] = user.accessToken;
        return dio.request(options.path, options: options);
      }
      dio.lock();
      dio.interceptors.responseLock.lock();
      dio.interceptors.errorLock.lock();

      return userService
          .authenticate(
              model: AuthenticationModel(
                  login: user.userName, password: user.userName))
          .then((d) {
        options.headers['Authorization'] = d.accessToken;
      }).whenComplete(() {
        dio.unlock();
        dio.interceptors.responseLock.unlock();
        dio.interceptors.errorLock.unlock();
      }).then((e) => dio.request(options.path, options: options));
    } else {
      throw e.response.data[0] ?? e.response.data['errorMessage'];
    }
  }
}
