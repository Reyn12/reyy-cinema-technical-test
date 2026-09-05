class ApiError implements Exception {
  ApiError({
    required this.message,
    this.errors,
  });

  final String message;
  final Map<String, List<String>>? errors;

  factory ApiError.fromJson(Map<String, dynamic> json) {
    final message = (json['message'] ?? json['error'] ?? 'Terjadi kesalahan')
        .toString();

    return ApiError(
      message: message,
      errors: _parseErrors(json['errors']),
    );
  }

  static Map<String, List<String>>? _parseErrors(dynamic rawErrors) {
    if (rawErrors is! Map) return null;

    return rawErrors.map((key, value) {
      final list = value is List ? value : <dynamic>[];
      final stringList = list.map((e) => e.toString()).toList();
      return MapEntry(key.toString(), stringList);
    });
  }

  @override
  String toString() {
    if (errors == null || errors!.isEmpty) return 'ApiError: $message';
    return 'ApiError: $message, errors: $errors';
  }
}

class ApiMetadata {
  const ApiMetadata({
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
    this.totalAmount,
    this.totalPaid,
    this.totalUnpaid,
  });

  final int total;
  final int page;
  final int limit;
  final int totalPages;
  final num? totalAmount;
  final num? totalPaid;
  final num? totalUnpaid;

  factory ApiMetadata.fromJson(Map<String, dynamic> json) {
    return ApiMetadata(
      total: _toInt(json['total']),
      page: _toInt(json['page'], fallback: 1),
      limit: _toInt(json['limit'], fallback: 10),
      totalPages: _toInt(json['total_pages']),
      totalAmount: _toNum(json['total_amount']),
      totalPaid: _toNum(json['total_paid']),
      totalUnpaid: _toNum(json['total_unpaid']),
    );
  }

  static int _toInt(dynamic value, {int fallback = 0}) {
    if (value is num) return value.toInt();
    return fallback;
  }

  static num? _toNum(dynamic value) {
    if (value is num) return value;
    return null;
  }
}

class ApiPaginatedResponse<T> {
  const ApiPaginatedResponse({
    required this.data,
    this.metadata,
  });

  final List<T> data;
  final ApiMetadata? metadata;
}
