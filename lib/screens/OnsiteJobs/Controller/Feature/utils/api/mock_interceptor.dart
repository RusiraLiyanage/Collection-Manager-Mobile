import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:project_code_blue/screens/OnsiteJobs/Controller/Feature/utils/api/api_exceptions.dart';
import 'package:project_code_blue/screens/OnsiteJobs/Controller/Feature/utils/utils.dart';

class MockInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Check endpoint
    if (options.path == ApiConstants.getJobsEndpoint) {
      final mockJson = await rootBundle
          .loadString('assets/mockData/OnsiteJobs/onSiteJobs.json');

      final mockData = json.decode(mockJson);

      return handler.resolve(
        Response(requestOptions: options, statusCode: 200, data: mockData),
      );
    }

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw TimeoutException(requestOptions: err.requestOptions);
      case DioExceptionType.connectionError:
        throw NoInternetException(requestOptions: err.requestOptions);
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
      case DioExceptionType.cancel:
      case DioExceptionType.unknown:
        throw UnknownErrorException(requestOptions: err.requestOptions);
    }
  }
}
