import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:alkafeel_blog/data/remote/app_exception.dart';
import 'package:alkafeel_blog/data/remote/network/base_api_service.dart';

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
      routeParam.forEach((key, value) {
        url = url.replaceFirst("{$key}", value);
      });
      // send the request.
      final response = await http.get(
        Uri.parse(baseUrl + url),
        headers: headers,
      );
      // process the response code.
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
    String body = "",
  }) async {

    dynamic responseJson;
    try {
      final response = await http.post(
          Uri.parse(baseUrl + url),
          body: body,
          headers: headers,
      );
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
    String body = "",
  }) async {

    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(baseUrl + url),
        body: body,
        headers: headers,
      );
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
    String body = "",
  }) async {

    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(baseUrl + url),
        body: body,
        headers: headers,
      );
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
      final response = await http.post(
        Uri.parse(baseUrl + url),
        headers: headers,
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 204:
        dynamic responseJson = "";
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 403:
        throw ForbiddenException(response.body.toString());
      case 404:
        throw NotFoundException(response.body.toString());
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