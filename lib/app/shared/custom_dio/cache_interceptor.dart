import 'package:dio/dio.dart';

class CacheInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    print('Request[${options.method}] => PATH: ${options.path}');

    //var prefs = await SharedPreferences.getInstance();
    var uri = options.uri;

    if (options.extra.containsKey('refresh')) {
      // if (options.extra['refresh'] || !prefs.containsKey('$uri')) {
      if (options.extra['refresh']) {
        return super.onRequest(options);
      } else {
        return getCache(uri);
      }
    }

    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) async {
    print('Response[${response.statusCode}] => PATH: ${response.request.path}');
    // var prefs = await SharedPreferences.getInstance();
    // prefs.setString('${response.request.uri}', jsonEncode(response.data));

    return super.onResponse(response);
  }

  @override
  Future onError(DioError e) async {
    //print('Response[${e.response.statusCode}] => PATH: ${e.request.path}');
    if (e.type == DioErrorType.CONNECT_TIMEOUT ||
        e.type == DioErrorType.DEFAULT) {
      print(e.message);
      return getCache(e.request.uri);
    } else {
      return e;
    }
  }

  getCache(Uri uri) async {
    //var prefs = await SharedPreferences.getInstance();
    //if (prefs.containsKey('$uri')) {
    if (true) {
      //var res = jsonDecode(prefs.getString('$uri'));

      //return Response(data: res, statusCode: 200);
      return Response(data: null, statusCode: 200);
    }
    // else {
    //   return Response(data: null, statusCode: 500);
    // }
  }
}
