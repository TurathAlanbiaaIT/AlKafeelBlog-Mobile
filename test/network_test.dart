import 'package:alkafeel_blog/data/remote/network/network_api_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/data/remote/network/api_end_points.dart';

enum RequestType {
  get, post, put, patch, delete,
}

void main() {
  networkTest(
      requestType: RequestType.get,
      endpoint: ApiEndPoints.auth.me,
      headers: {"api-key": "z6LWPfkgCiIQsuQpjTWULfzWwCXUEOIEqzTjbdCM0sazwBneLS3YIQYRor0l0S9fIdbt2D4US9jK4jFclg7nl8ESRSacuYv9sFd9"}
  );
}

void networkTest({
  required requestType,
  required endpoint,
  Map<String, String> routeParam = const {},
  Map<String, String> queryParam = const {},
  Map<String, String> headers = const {},
  body = ""
}) {

  test("$requestType $endpoint", () async {

    // final response.
    String res;
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

    // expect("ss", String);
    // res
    //     .then((value) => print(value+"ee"))
    //     .onError((error, stackTrace) => print(""));

  });
}