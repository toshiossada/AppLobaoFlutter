import 'package:dio/dio.dart';
import 'package:projeto_lobao/app/shared/utils/settings.dart';

import 'interceptor.dart';

class CustomDio {
  final Dio client;

  CustomDio(this.client) {
    client.options = BaseOptions();
    client.options.baseUrl = '${Settings.apiUrl}}';

    client.interceptors.add(CustomInterceptors());

    client.options.connectTimeout = 25000;
  }
}
