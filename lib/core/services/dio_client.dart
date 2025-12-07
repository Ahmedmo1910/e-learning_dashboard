import 'package:dio/dio.dart';
import 'package:teachers_dashboard/core/helper_functions/secure_storage.dart';
import 'package:teachers_dashboard/features/auth/data/auth_repo.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://edugate-e-learning.runasp.net',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  DioClient() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SecureStorage.getAccessToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },

        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            final refreshed = await AuthRepo().refreshToken(); // boolean
            if (refreshed) {
              final newToken = await SecureStorage.getAccessToken();
              error.requestOptions.headers["Authorization"] =
                  "Bearer $newToken";

              final cloneReq = await _dio.fetch(error.requestOptions);
              return handler.resolve(cloneReq);
            }
          }
          return handler.next(error);
        },
      ),
    );
  }

  Dio get dio => _dio;
}
