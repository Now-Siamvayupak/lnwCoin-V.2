import 'dart:convert';
import 'dart:io';

import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';

//region Common
enum HttpMethod { GET, POST, DELETE, PUT }

Map<String, String> buildHeaderTokens() {
  Map<String, String> header = {
    HttpHeaders.contentTypeHeader: 'application/json;',
    HttpHeaders.cacheControlHeader: 'no-cache',
    HttpHeaders.acceptHeader: 'application/json;',
  };

  log(jsonEncode(header));
  return header;
}

Uri buildBaseUrl(String endPoint) {
  String url = '';
  if (!endPoint.startsWith('http')) url = '${AppConstant.baseUrl}$endPoint';

  var containsQueryParams = url.contains("?");
  url = '${AppConstant.baseUrl}$endPoint' + (containsQueryParams == true ? "&" : "?" + "x_cg_api_key=" + AppConstant.cgApiKey);

  log('URL: ${url.toString()}');

  return Uri.parse(url);
}

Future<Response> buildHttpResponse(String endPoint, {HttpMethod method = HttpMethod.GET, Map? request}) async {
  if (await isNetworkAvailable()) {
    var headers = buildHeaderTokens();
    Uri url = buildBaseUrl(endPoint);

    Response response;

    if (method == HttpMethod.POST) {
      log('Request: $request');

      response = await http.post(url, body: jsonEncode(request), headers: headers);
    } else if (method == HttpMethod.DELETE) {
      response = await delete(url, headers: headers);
    } else if (method == HttpMethod.PUT) {
      response = await put(url, body: jsonEncode(request), headers: headers);
    } else {
      response = await get(url, headers: headers);
    }

    log('Response ($method): ${response.statusCode} ${response.body}');

    return response;
  } else {
    throw errorInternetNotAvailable;
  }
}

Future handleResponse(Response response) async {
  if (!await isNetworkAvailable()) {
    throw errorInternetNotAvailable;
  }
  if (response.statusCode == 401) {
    log('Wrong APi');
  }

  if (response.statusCode.isSuccessful()) {
    return jsonDecode(response.body);
  } else {
    try {
      var body = jsonDecode(response.body);

      if (body['status'] != null) {
        throw body['status']['error_message'];
      }

      throw AppCommon.parseHtmlString(body['message']);
    } on Exception catch (e) {
      log(e);
      throw errorSomethingWentWrong;
    }
  }
}

//endregion
