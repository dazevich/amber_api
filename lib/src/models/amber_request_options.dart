import 'package:meta/meta.dart';

/// Configuration options for API requests
@immutable
final class AmberRequestOptions {
  final Map<String, dynamic>? headers;
  final Duration timeout;
  final int maxRetries;
  final bool requiresAuth;
  final Map<String, dynamic>? queryParameters;

  const AmberRequestOptions({
    this.headers,
    this.timeout = const Duration(seconds: 30),
    this.maxRetries = 3,
    this.requiresAuth = true,
    this.queryParameters,
  });

  AmberRequestOptions copyWith({
    Map<String, dynamic>? headers,
    Duration? timeout,
    int? maxRetries,
    bool? requiresAuth,
    Map<String, dynamic>? queryParameters,
  }) {
    return AmberRequestOptions(
      headers: headers ?? this.headers,
      timeout: timeout ?? this.timeout,
      maxRetries: maxRetries ?? this.maxRetries,
      requiresAuth: requiresAuth ?? this.requiresAuth,
      queryParameters: queryParameters ?? this.queryParameters,
    );
  }
}
