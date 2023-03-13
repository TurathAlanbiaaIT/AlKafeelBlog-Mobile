import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:alkafeel_blog/data/remote/app_exception.dart';
import 'package:alkafeel_blog/data/remote/network/base_api_service.dart';
import 'package:http/http.dart';

class NetworkApiService extends BaseApiService {

  @override
  Future getResponse({
    required String url,
    Map<String, String> routeParam = const {},
    Map<String, String> queryParam = const {},
    Map<String, String> headers = const {},
  }) async {

    dynamic responseJson;
    try {
      // set route params (or urls param).
      url = setRouteParams(url, routeParam);

      // set query params to urls.
      String q = getQueryParams(queryParam);

      // send the request.
      final response = await http.get(
        Uri.parse(baseUrl + url + q),
        headers: headers,
      );

      // process response code.
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future postResponse({
    required String url,
    Map<String, String> routeParam = const {},
    Map<String, String> queryParam = const {},
    Map<String, String> headers = const {},
    var body = "",
  }) async {

    dynamic responseJson;
    try {
      // set route params (or urls param).
      url = setRouteParams(url, routeParam);

      // set query params to urls.
      String q = getQueryParams(queryParam);

      // send the request.
      final response = await http.post(
          Uri.parse(baseUrl + url + q),
          headers: headers,
          body: body
      );

      // process response date.
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future putResponse({
    required String url,
    Map<String, String> routeParam = const {},
    Map<String, String> queryParam = const {},
    Map<String, String> headers = const {},
    var body = "",
  }) async {

    dynamic responseJson;
    try {
      // set route params (or urls param).
      url = setRouteParams(url, routeParam);

      // set query params to urls.
      String q = getQueryParams(queryParam);

      // send the request.
      final response = await http.post(
        Uri.parse(baseUrl + url + q),
        headers: headers,
        body: body
      );

      // process response data.
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future patchResponse({
    required String url,
    Map<String, String> routeParam = const {},
    Map<String, String> queryParam = const {},
    Map<String, String> headers = const {},
    var body = "",
  }) async {

    dynamic responseJson;
    try {
      // set route params (or urls param).
      url = setRouteParams(url, routeParam);

      // set query params to urls.
      String q = getQueryParams(queryParam);

      // send the request.
      final response = await http.post(
        Uri.parse(baseUrl + url + q),
        headers: headers,
        body: body
      );

      // process response data.
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future deleteResponse({
    required String url,
    Map<String, String> routeParam = const {},
    Map<String, String> queryParam = const {},
    Map<String, String> headers = const {},
  }) async {

    dynamic responseJson;
    try {
      // set route params (or urls param).
      url = setRouteParams(url, routeParam);

      // set query params to urls.
      String q = getQueryParams(queryParam);

      // send the request.
      final response = await http.post(
        Uri.parse(baseUrl + url + q),
        headers: headers,
      );

      // process response data.
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  /// set route params (or urls param).
  String setRouteParams(url, routeParam) {
    String newUrl = url;
    routeParam.forEach((key, value) {
      newUrl = url.replaceFirst("{$key}", value);
    });

    return newUrl;
  }

  /// set query params to urls.
  String getQueryParams(queryParam) {
    String q = "";
    if(queryParam.isNotEmpty) {
      q = "?";
      queryParam.forEach((key, value) {
        q+= "$key=$value&&";
      });
    }

    return q;
  }

  /// process response data.
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        Response responseJson = response;
        return responseJson;
      case 204:
        dynamic responseJson = "";
        return responseJson;
      case 400:
        throw BadRequestException(response.body);
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 403:
        throw ForbiddenException(response.body.toString());
      case 404:
        throw NotFoundException(response.body.toString());
      case 405:
        throw MethodNotAllowedException(response.body.toString());
      case 422:
        throw InvalidInputException(response.body.toString());
      case 500:
        throw NotFoundException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while communication with server'
            ' with status code : ${response.statusCode}');
    }
  }

}