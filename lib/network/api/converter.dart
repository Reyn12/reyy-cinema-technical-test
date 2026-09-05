import 'api_response.dart';

class Converter {
  static Map<String, dynamic> _asMap(dynamic responseData) {
    if (responseData is! Map<String, dynamic>) {
      throw ApiError(message: 'Unexpected response format');
    }
    return responseData;
  }

  static List<Map<String, dynamic>> _extractListMap(Map<String, dynamic> json) {
    final rawData = json['data'];

    if (rawData is List) {
      return rawData
          .map((item) => (item as Map).cast<String, dynamic>())
          .toList();
    }

    throw ApiError(message: 'Unexpected data format');
  }

  static Map<String, dynamic> _extractSingleMap(Map<String, dynamic> json) {
    final rawData = json['data'];

    if (rawData is Map) {
      return rawData.cast<String, dynamic>();
    }

    // Flat response, e.g. login: { token, user, school }
    return json;
  }

  static List<T> list<T>(
    dynamic responseData,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final json = _asMap(responseData);

    return _extractListMap(json).map(fromJson).toList();
  }

  static ApiPaginatedResponse<T> paginatedList<T>(
    dynamic responseData,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final json = _asMap(responseData);
    final items = _extractListMap(json).map(fromJson).toList();

    final rawMetadata = json['metadata'];
    final metadata = rawMetadata is Map<String, dynamic>
        ? ApiMetadata.fromJson(rawMetadata)
        : null;

    return ApiPaginatedResponse(data: items, metadata: metadata);
  }

  static T single<T>(
    dynamic responseData,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final json = _asMap(responseData);

    return fromJson(_extractSingleMap(json));
  }
}
