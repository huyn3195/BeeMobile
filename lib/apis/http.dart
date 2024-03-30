import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:beelive/utils/utils.dart';
import 'package:beelive/constants/constants.dart';
import 'package:beelive/global.dart';

class Http {
  static final Http _instance = Http._internal();
  factory Http() => _instance;

  late Dio dio;

  Http._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_BASE_URL,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      headers: {},
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );

    dio = Dio(options);

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    CookieJar cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Do something before request is sent
        return handler.next(options); //continue
      },
      onResponse: (response, handler) {
        // Do something with response data
        // List<String>? rawCookie = response.headers['raw-cookie'];

        // CookieUtil parsedCookie = CookieUtil.parse(rawCookie);

        // Global.storageService.setString(
        //     AppConstants.STORAGE_USER_TOKEN_KEY, parsedCookie.accessToken!);

        return handler.next(response); // continue
      },
      onError: (DioError e, handler) {
        // Do something with response error
        Loading.dismiss();
        ErrorEntity eInfo = createErrorEntity(e);
        onError(eInfo);
        return handler.next(e); //continue
      },
    ));
  }

  void onError(ErrorEntity eInfo) {
    EasyLoading.showError(eInfo.message!);
    // switch (eInfo.code) {
    //   case 401:
    //     // UserStore.to.onLogout();
    //     Global.storageService.remove(AppConstants.STORAGE_USER_PROFILE_KEY);
    //     Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    //     if (Global.navigatorKey.currentContext != null) {
    //       Navigator.of(Global.navigatorKey.currentContext!)
    //           .pushNamedAndRemoveUntil(
    //               AppRoutes.signIn, (Route<dynamic> route) => false);
    //     }
    //     EasyLoading.showError("Token expired, do log in again");

    //     break;
    //   default:
    //     // EasyLoading.showError('unknown mistake');
    //     break;
    // }
  }

  ErrorEntity createErrorEntity(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return ErrorEntity(code: -1, message: "Request canceled");
      case DioErrorType.connectTimeout:
        return ErrorEntity(code: -1, message: "Connection Timed Out");
      case DioErrorType.sendTimeout:
        return ErrorEntity(code: -1, message: "Request Timed Out");
      case DioErrorType.receiveTimeout:
        return ErrorEntity(code: -1, message: "Response Timed Out");
      case DioErrorType.response:
        {
          try {
            int errCode =
                error.response != null ? error.response!.statusCode! : -1;

            return ErrorEntity.fromJson(error.response!.data, errCode);
          } on Exception catch (_) {
            return ErrorEntity(code: -1, message: "Unknown Mistake");
          }
        }
      default:
        {
          return ErrorEntity(code: -1, message: error.message);
        }
    }
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var token = Global.storageService.getUserToken();

    if (token.isNotEmpty) {
      headers['User-Access-Token'] = token;
    }
    return headers;
  }

  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    // EasyLoading.show(indicator: CircularProgressIndicator(),maskType: EasyLoadingMaskType.clear,dismissOnTap: true);
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
    );
    // EasyLoading.dismiss();

    // List<String>? rawCookie = response.headers['raw-cookie'];

    return response.data;
  }
}

class ErrorEntity implements Exception {
  int? code;
  String? message;
  bool? success;

  ErrorEntity({this.code, this.message, this.success});

  factory ErrorEntity.fromJson(Map<String, dynamic> json, int code) =>
      ErrorEntity(
        code: code,
        message: json['message'],
        success: json['success'],
      );

  @override
  String toString() {
    if (message == "") return "Exception";
    return "Exception: code $code, $message";
  }
}

// class CookieUtil {
//   String? accessToken;
//   String? refreshToken;

//   CookieUtil({
//     this.accessToken,
//     this.refreshToken,
//   });

//   factory CookieUtil.parse(List<String>? rawCookie) {
//     Map<String, dynamic> object = {};
//     for (var cookie in rawCookie!) {
//       List<String> parts = cookie.split('; ');
//       for (var part in parts) {
//         List<String> item = part.split('=');
//         if (item.length == 2) object[item[0]] = item[1];
//       }
//     }

//     return CookieUtil(
//         accessToken: object['x-access-token'],
//         refreshToken: object['x-refresh-token']);
//   }
// }
