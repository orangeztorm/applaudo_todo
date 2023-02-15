class CacheException implements Exception {
  const CacheException({required this.message, this.code});

  final String message;
  final Object? code;

  @override
  String toString() => 'CacheException(message: $message, code: $code)';
}

/// Throws when cache is empty or not found
///
class NotFoundCacheException extends CacheException {
  // ignore: use_super_parameters
  const NotFoundCacheException({
    required String message,
    Object? code,
  }) : super(
          message: message,
          code: code,
        );

  @override
  String toString() => 'NotFoundCacheException(message: $message, code: $code)';
}

/// Throw when cache is expired
class ExpiredCacheException extends CacheException {
  // ignore: use_super_parameters
  const ExpiredCacheException({
    required String message,
    Object? code,
  }) : super(
          message: message,
          code: code,
        );

  @override
  String toString() => 'ExpiredCacheException(message: $message, code: $code)';
}
