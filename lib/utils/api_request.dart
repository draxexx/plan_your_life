import 'package:http/http.dart' as http;
import '../index.dart';

String endpointENV = dotenv.env["API_ENV"]! == "local"
    ? dotenv.env["API_URI_LOCAL"]!
    : dotenv.env["API_URI_PROD"]!;

bool isHttps = false;

String version = "api/v1";

Future<ResponseModel> getRequest(
    {String? path, Map<String, dynamic>? queryParameters}) async {
  try {
    var url = isHttps
        ? Uri.https(endpointENV, "$version$path", queryParameters)
        : Uri.http(endpointENV, "$version$path", queryParameters);

    var response = await http.get(url);

    return ResponseModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    // ignore: avoid_print
    print("error: ${e.toString()}");
    return ResponseModel(
      status: "error",
    );
  }
}

Future<ResponseModel> postRequest(
    {String? path, Map<String, dynamic>? queryParameters, Object? body}) async {
  try {
    var url = isHttps
        ? Uri.https(endpointENV, "$version$path", queryParameters)
        : Uri.http(endpointENV, "$version$path", queryParameters);

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };

    var response =
        await http.post(url, body: jsonEncode(body), headers: requestHeaders);

    return ResponseModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    // ignore: avoid_print
    print("error: ${e.toString()}");
    return ResponseModel(
      status: "error",
    );
  }
}

Future<ResponseModel> putRequest(
    {String? path, Map<String, dynamic>? queryParameters, Object? body}) async {
  try {
    var url = isHttps
        ? Uri.https(endpointENV, "$version$path", queryParameters)
        : Uri.http(endpointENV, "$version$path", queryParameters);

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };

    var response = await http.put(url,
        body: body == null ? jsonEncode({}) : jsonEncode(body),
        headers: requestHeaders);

    return ResponseModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    // ignore: avoid_print
    print("error: ${e.toString()}");
    return ResponseModel(
      status: "error",
    );
  }
}

Future<ResponseModel> deleteRequest(
    {String? path, Map<String, dynamic>? queryParameters, Object? body}) async {
  try {
    var url = isHttps
        ? Uri.https(endpointENV, "$version$path", queryParameters)
        : Uri.http(endpointENV, "$version$path", queryParameters);

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };

    var response = await http.delete(url,
        body: body == null ? jsonEncode({}) : jsonEncode(body),
        headers: requestHeaders);

    return ResponseModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    // ignore: avoid_print
    print("error: ${e.toString()}");
    return ResponseModel(
      status: "error",
    );
  }
}

Future<dynamic> postRequestToExternalAPI(
  String endpoint, {
  bool isHttps = true,
  String? path,
  Map<String, dynamic>? queryParameters,
  Object? body,
  Map<String, String>? requestHeadersParams,
}) async {
  try {
    var url = isHttps
        ? Uri.https(endpoint, "$version$path", queryParameters)
        : Uri.http(endpoint, "$version$path", queryParameters);

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };

    var response = await http.post(url,
        body: jsonEncode(body),
        headers: requestHeadersParams ?? requestHeaders);

    return jsonDecode(response.body);
  } catch (e) {
    // ignore: avoid_print
    print("error: ${e.toString()}");
    return false;
  }
}
