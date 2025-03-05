import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Modify headers
    options.headers['Accept-Language'] = "en";
    // I can add here print statements for logging

    // Continue with the request
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Log the response
    print("✅ Response Received: ${response.statusCode}");

    // I Modify response if needed

    // Continue processing [Another way without calling super]
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("❌ API Error (${err.response?.statusCode}): ${err.message}");

    if (err.response?.statusCode == 401) {
      print("🔄 Unauthorized! Refreshing token...");
      // Implement token refresh logic here
    }

    handler.next(err);
  }
}
