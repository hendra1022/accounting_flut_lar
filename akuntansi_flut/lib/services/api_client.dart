// import 'package:dio/dio.dart';

// import 'dio_module.dart';

// class ApiClient {
//   final Dio _dioModule = DioModule.instance.service();

//   Future<Response?> get(
//       {required String url,
//       Map<String, String> params = const {},
//       Function(dynamic, dynamic)? onReceiveProgress,
//       Map<String, dynamic> headers = const {}}) async {
//     print("[ GET Request ]: $url");
//     print("[ Params ]: $params");

//     try {
//       Response response = await _dioModule.get(url,
//           queryParameters: params,
//           options: Options(
//             headers: headers,
//           ),
//           onReceiveProgress: onReceiveProgress);
//       print("[ StatusCode ]: ${response.statusCode}");
//       return response;
//     } on DioError catch (e) {
//       print("[ Error ${e.response?.statusCode ?? 503}]: ${e.response}");
//       return e.response;
//     }
//   }

//   Future<Response?> getWithDioNewInstance(
//       {required String url,
//       Map<String, String> params = const {},
//       Map<String, dynamic> headers = const {}}) async {
//     print("[ GET Request ]: $url");
//     print("[ Params ]: $params");

//     try {
//       Response response = await Dio().get(url,
//           queryParameters: params, options: Options(headers: headers));
//       print("[ StatusCode ]: ${response.statusCode}");
//       return response;
//     } on DioError catch (e) {
//       print("[ Error ${e.response?.statusCode ?? 503}]: ${e.response}");
//       return e.response;
//     }
//   }

//   Future<Response?> postMultipart({
//     required String url,
//     Map<String, dynamic> headers = const {},
//     FormData? formData,
//   }) async {
//     try {
//       headers[Headers.contentTypeHeader] = "multipart/form-data";

//       print("[ PUT Multipart Request ]: $url");
//       print("[ FormData ]: $formData");

//       Response response = await _dioModule.post(url,
//           options: Options(headers: headers), data: formData);
//       print("[ StatusCode ]: ${response.statusCode}");
//       return response;
//     } on DioError catch (e) {
//       print("[ Error ${e.response?.statusCode ?? 503}]: ${e.response}");
//       return e.response;
//     }
//   }

//   Future<Response?> putMultipart({
//     required String url,
//     Map<String, dynamic> headers = const {},
//     FormData? formData,
//   }) async {
//     try {
//       headers[Headers.contentTypeHeader] = "multipart/form-data";

//       print("[ PUT Multipart Request ]: $url");
//       print("[ FormData ]: $formData");

//       Response response = await _dioModule.put(url,
//           options: Options(headers: headers), data: formData);
//       print("[ StatusCode ]: ${response.statusCode}");
//       return response;
//     } on DioError catch (e) {
//       print("[ Error ${e.response?.statusCode ?? 503}]: ${e.response}");
//       return e.response;
//     }
//   }

//   Future<Response?> post(
//       {required String url,
//       Map<String, dynamic> headers = const {},
//       Map<String, dynamic> body = const {}}) async {
//     // headers["Content-Type"] =  Headers.jsonContentType;

//     print("[ POST Request ]: $url");
//     print("[ Body ]: $body");
//     try {
//       Response response = await _dioModule.post(url,
//           options: Options(headers: headers), data: body);
//       print("[ StatusCode ]: ${response.statusCode}");
//       return response;
//     } on DioError catch (e) {
//       print("[ Error ${e.response?.statusCode ?? 503}]: ${e.response}");
//       return e.response;
//     }
//   }

//   Future<Response?> put({
//     required String url,
//     Map<String, dynamic> headers = const {},
//     Map<String, dynamic> params = const {},
//     Map<String, dynamic> body = const {},
//   }) async {
//     // headers["Content-Type"] =  Headers.jsonContentType;

//     print("[ PUT Request ]: $url");
//     print("[ Body ]: $body");

//     try {
//       Response response = await _dioModule.put(
//         url,
//         queryParameters: params,
//         options: Options(headers: headers),
//         data: body,
//       );
//       print("[ StatusCode ]: ${response.statusCode}");
//       return response;
//     } on DioError catch (e) {
//       print("[ Error ${e.response?.statusCode ?? 503}]: ${e.response}");
//       return e.response;
//     }
//   }

//   Future<Response?> putWithBodyList({
//     required String url,
//     Map<String, dynamic> headers = const {},
//     Map<String, String> params = const {},
//     List<Map<String, dynamic>> body = const [],
//   }) async {
//     // headers["Content-Type"] =  Headers.jsonContentType;

//     print("[ PUT Request ]: $url");
//     print("[ Body ]: $body");

//     try {
//       Response response = await _dioModule.put(
//         url,
//         queryParameters: params,
//         options: Options(headers: headers),
//         data: body,
//       );
//       print("[ StatusCode ]: ${response.statusCode}");
//       return response;
//     } on DioError catch (e) {
//       print("[ Error ${e.response?.statusCode ?? 503}]: ${e.response}");
//       return e.response;
//     }
//   }

//   Future<Response?> delete(
//       {required String url,
//       Map<String, dynamic> headers = const {},
//       Map<String, dynamic> body = const {}}) async {
//     // headers["Content-Type"] =  Headers.jsonContentType;

//     print("[ DELETE Request ]: $url");
//     print("[ Body ]: $body");

//     try {
//       Response response = await _dioModule.delete(url,
//           options: Options(headers: headers), data: body);
//       print("[ StatusCode ]: ${response.statusCode}");
//       return response;
//     } on DioError catch (e) {
//       print("[ Error ${e.response?.statusCode ?? 503}]: ${e.response}");
//       return e.response;
//     }
//   }

//   Future<Response?> deleteWithBodyList({
//     required String url,
//     Map<String, dynamic> headers = const {},
//     Map<String, String> params = const {},
//     List<Map<String, dynamic>> body = const [],
//   }) async {
//     // headers["Content-Type"] =  Headers.jsonContentType;

//     print("[ PUT Request ]: $url");
//     print("[ Body ]: $body");

//     try {
//       Response response = await _dioModule.delete(
//         url,
//         queryParameters: params,
//         options: Options(headers: headers),
//         data: body,
//       );
//       print("[ StatusCode ]: ${response.statusCode}");
//       return response;
//     } on DioError catch (e) {
//       print("[ Error ${e.response?.statusCode ?? 503}]: ${e.response}");
//       return e.response;
//     }
//   }

//   Future<Map<String, dynamic>> download({
//     required String url,
//     required String fileDestination,
//     Map<String, dynamic> headers = const {},
//     Function(dynamic, dynamic)? onReceiveProgress,
//   }) async {
//     // headers["Content-Type"] =  Headers.jsonContentType;

//     print("[ DOWNLOAD Request ]: $url");

//     try {
//       Response response = await _dioModule.download(url, fileDestination,
//           options: Options(headers: headers),
//           onReceiveProgress: onReceiveProgress);
//       print("[ StatusCode ]: ${response.statusCode}");
//       return {
//         "code": response.statusCode ?? 503,
//         "messages": response.statusMessage ?? "Internal Server Error",
//       };
//     } on DioError catch (e) {
//       print("[ Error ${e.response?.statusCode ?? 503}]: ${e.response}");
//       return {
//         "code": e.response!.statusCode ?? 503,
//         "messages": e.response!.statusMessage ?? "Internal Server Error",
//       };
//     }
//   }

//   Map<String, dynamic> responseHandler(Response? res) {
//     String message = "Something wrong, please try again ";
//     if (res == null && res?.data is String) {
//       message += ", check your connection or contact our customer service";
//       res?.data = null;
//     } else {
//       print(res?.data.toString());
//       if (res?.data['messages'] == null) {
//         message = "Something wrong, please try again";
//       } else {
//         message = res?.data['messages']["err_msg"][0] ??
//             "Something wrong, please try again";
//       }
//     }

//     return {
//       "code": res?.statusCode ?? 503,
//       "messages": message,
//       "data": res?.data != null ? res!.data["data"] : null,
//     };
//   }
// }
