abstract class BaseApiService {

  final String baseUrl = "https://alkafeelblog-api.turathalanbiaa.com";

  Future<dynamic> getResponse({
    required String url,
    Map<String, String> routeParam = const {},
    Map<String, String> queryParam = const {},
    Map<String, String> headers = const {},
  });
  Future<dynamic> postResponse({
    required String url,
    Map<String, String> routeParam = const {},
    Map<String, String> queryParam = const {},
    Map<String, String> headers = const {},
    var body = "",
  });
  Future<dynamic> putResponse({
    required String url,
    Map<String, String> routeParam = const {},
    Map<String, String> queryParam = const {},
    Map<String, String> headers = const {},
    var body = "",
  });
  Future<dynamic> patchResponse({
    required String url,
    Map<String, String> routeParam = const {},
    Map<String, String> queryParam = const {},
    Map<String, String> headers = const {},
    var body = "",
  });
  Future<dynamic> deleteResponse({
    required String url,
    Map<String, String> routeParam = const {},
    Map<String, String> queryParam = const {},
    Map<String, String> headers = const {},
  });

}