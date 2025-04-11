import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:userlist_app/core/services/interfaces/network_service.dart';

@Injectable(as: NetworkService)
class DioNetworkService extends NetworkService {
  DioNetworkService(this.dio) {
    dio.options = dioBaseOptions;
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
    }
  }
  final Dio dio;

  BaseOptions get dioBaseOptions =>
      BaseOptions(baseUrl: baseUrl, headers: headers);

  @override
  String get baseUrl => 'https://dummyjson.com/';

  @override
  Map<String, Object> get headers => {
    'accept': 'application/json',
    'content-type': 'application/json',
  };

  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    dio.options.headers = header;
    return header;
  }

  @override
  Future<Response<dynamic>> post(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    final res = await dio.post<dynamic>(baseUrl + path, data: data);
    return res;
  }

  @override
  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final res = await dio.get<dynamic>(
      baseUrl + path,
      queryParameters: queryParameters,
    );
    return res;
  }
}
