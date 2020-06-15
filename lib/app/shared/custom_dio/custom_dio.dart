import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:projeto_lobao/app/shared/utils/settings.dart';

import 'interceptor.dart';

class CustomDio extends DioForNative {
  CustomDio() {
    options = BaseOptions();
    options.baseUrl = '${Settings.apiUrl}}';

    interceptors.add(CustomInterceptors());

    options.connectTimeout = 25000;
  }
}
