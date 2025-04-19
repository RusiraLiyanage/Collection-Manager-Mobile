import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'mock_interceptor.dart'; // your interceptor

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;

  late Dio dio;

  ApiService._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://your.api.com', // Not used in mock, but required
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
    PrettyDioLogger prettyDioLogger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    );
    MockInterceptor mockInterceptor = MockInterceptor();
    // Add interceptors
    dio.interceptors.addAll({prettyDioLogger, mockInterceptor});
  }

  // Add more methods like postData(), getItems(), etc.
}
