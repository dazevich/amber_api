import 'package:dio/dio.dart';

typedef ResponseDataHandler<T> = T Function(dynamic data);

abstract base class AmberApiBase {
  final Dio _dio;
  final Map<Type, ResponseDataHandler> _responseHandlers;

  const AmberApiBase(this._dio) : _responseHandlers = const {};

  Future<T> get<T>(String path) => _makeRequest(() => _dio.get(path));

  Future<T> _makeRequest<T>(Future<dynamic> Function() request) async {
    try {
      final response = await request();
      return _handleResponse<T>(response);
    } catch (e) {}
  }

  Future<T> _handleResponse<T>(Response response) async {}

  void registerDataHandler<T>(ResponseDataHandler<T> handler) {
    if (_responseHandlers[T] != null) {
      throw Exception('handler of $T already registered');
    }

    _responseHandlers[T] = handler;
  }

  ResponseDataHandler<T>? resolveDataHandler<T>() => _responseHandlers[T] as ResponseDataHandler<T>?;
}

final class AmberApi extends AmberApiBase {
  AmberApi() : super(Dio());

  AmberApi.fromDio(super.dio);
}
