import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:simple_music/utils/utils..dart';

class Http {
  static final Dio dio = Dio(BaseOptions(
    baseUrl: 'http://api.music.eraylee.com/',
    connectTimeout: 5000,
  ));

  /// 初始化
  static void init() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    CookieJar cookieJar = PersistCookieJar(dir: tempPath);
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      print("\n================== 请求数据 ==========================");
      print("url = ${options.uri.toString()}");
      print("headers = ${options.headers}");
      print("params = ${options.data}");
    }, onResponse: (Response response) {
      print("\n================== 响应数据 ==========================");
      print("code = ${response.statusCode}");
      print("data = ${response.data}");
      print("\n");
    }, onError: (DioError e) {
      print("\n================== 错误响应数据 ======================");
      print("type = ${e.type}");
      print("message = ${e.message}");
      print("\n");
    }));
    dio.interceptors.add(CookieManager(cookieJar));
  }

  /// get请求
  static get(String path, {Map<String, dynamic> queryParameters}) async {
    return await request(path,
        queryParameters: queryParameters, option: new Options(method: "GET"));
  }

  static post(String path,
      {data, Map<String, dynamic> queryParameters, Options options}) async {
    return await request(path,
        data: data,
        queryParameters: queryParameters,
        option: new Options(method: "POST"));
  }

  /// 封装通用请求
  static request(
    url, {
    data,
    Map<String, dynamic> queryParameters,
    Options option,
  }) async {
    //没有网络
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Utils.showToast('请链接网络');
      return Future.error(('请链接网络'));
    }

    try {
      Response response = await dio.request(url,
          data: data, queryParameters: queryParameters, options: option);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        Utils.showToast(response.data.msg);
      }
    } on DioError catch (e) {
      if (e == null) {
        return Future.error(Response(data: -1));
      } else if (e.response != null) {
        if (e.response.statusCode >= 300 && e.response.statusCode < 400) {
          return Future.error(e.toString());
        } else {
          return Future.value(e.response);
        }
      } else {
        return Future.error((e.toString()));
      }
    }
  }
}
