import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

class DioClient {
  final Dio dio;
  late Dio client;

  DioClient(this.dio) {
    client = dio;
    client.options.baseUrl = dotenv.env['BASE_URL']!;
    client.options.connectTimeout = const Duration(seconds: 5);
    client.options.receiveTimeout = const Duration(seconds: 5);
    client.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    client.interceptors.add(
      RetryInterceptor(
        dio: dio,
        retries: 3,
      ),
    );
  }
}
