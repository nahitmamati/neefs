class ServerException implements Exception {
  ServerException({required this.message});
  final String message;
}

class CacheException implements Exception {
  CacheException({required this.message});
  final String message;
}
