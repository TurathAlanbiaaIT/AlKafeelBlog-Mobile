import 'dart:convert';

import 'package:alkafeel_blog/data/remote/network/api_end_points.dart';
import 'package:alkafeel_blog/data/remote/network/network_api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

import 'cache.dart';

enum RequestType {
  get, post, put, patch, delete,
}

void main() {
  // Authentication:
  // networkTest(
  //   requestType: RequestType.post,
  //   endpoint: ApiEndPoints.auth.register,
  //   headers: {
  //     Constants.apiKey["key"]!: Constants.apiKey["value"]!,
  //     Constants.apiLanguage["key"]!: Constants.apiLanguage["value"]!,
  //   },
  //   body: {
  //     "name": "nameer",
  //     "email": "nameer1@gmail.com",
  //     "password": "123456Nn",
  //     "password_confirmation": "123456Nn",
  //   },
  //   afterTestTask: (response) {
  //     Map body = json.decode(response.body);
  //     Storage.token["value"] = body["date"]["token"];
  //     print(body["date"]["token"]);
  //   }
  // );

  networkTest(
    requestType: RequestType.post,
    endpoint: ApiEndPoints.auth.login,
    headers: {
      Constants.apiKey["key"]!: Constants.apiKey["value"]!,
      Constants.apiLanguage["key"]!: Constants.apiLanguage["value"]!,
    },
    body: {
      "username": "nameer242@gmail.com",
      "password": "123456Nn",
    },
    afterTestTask: (response) {
      Map body = json.decode(response.body);
      Storage.token["value"] = "Bearer ${body["data"]["token"]}";
    }
  );

  print(Storage.token["value"]!+"ddd");
  networkTest(
    requestType: RequestType.get,
    endpoint: ApiEndPoints.auth.me,
    headers: {
      Constants.apiKey["key"]!: Constants.apiKey["value"]!,
      Constants.apiLanguage["key"]!: Constants.apiLanguage["value"]!,
      Storage.token["key"]!: Storage.token["value"]!,
    },
  );
}

void networkTest({
  required requestType,
  required endpoint,
  Map<String, String> routeParam = const {},
  Map<String, String> queryParam = const {},
  Map<String, String> headers = const {},
  body = "",
  void Function(Response response)? afterTestTask,
}) {

  // final response.
  Response? res;

  test("$requestType $endpoint", () async {

    // function parameters.
    var p = {
      const Symbol('url'): endpoint,
      const Symbol('routeParam'): routeParam,
      const Symbol('queryParam'): queryParam,
      const Symbol('headers'): headers,
    };

    // send an http request with a specific request type.
    switch(requestType) {

      case RequestType.get:
        res = await Function.apply(NetworkApiService().getResponse, [], p);
        break;

      case RequestType.post:
        p[const Symbol('body')] = body;
        res = await Function.apply(NetworkApiService().postResponse, [], p);
        break;

      case RequestType.put:
        p[const Symbol('body')] = body;
        res = await Function.apply(NetworkApiService().putResponse, [], p);
        break;

      case RequestType.patch:
        p[const Symbol('body')] = body;
        res = await Function.apply(NetworkApiService().patchResponse, [], p);
        break;

      case RequestType.delete:
        res = await Function.apply(NetworkApiService().deleteResponse, [], p);
        break;

      default:
        throw Exception("requestType not found: $requestType");

    }

    if(afterTestTask != null) {
      afterTestTask(res!);
    }

    print(res!.body);
  });
}