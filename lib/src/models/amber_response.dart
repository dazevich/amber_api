import 'package:meta/meta.dart';

@immutable
final class AmberResponse<T> {
  final bool success;
  final T? data;
  final String? message;
  final Exception? error;

  const AmberResponse({required this.success, this.data, this.message, this.error});

  factory AmberResponse.success({required T data}) => AmberResponse(success: true, data: data);

  factory AmberResponse.error({required Exception error, String? message}) =>
      AmberResponse(success: false, error: error, message: message);

  R when<R>({required R Function(T data) success, required R Function(Exception error) error}) {
    if (this.success && data != null) {
      return success(data as T);
    }

    if (this.error == null) {
      throw ArgumentError.notNull('error');
    }

    return error(this.error!);
  }
}
