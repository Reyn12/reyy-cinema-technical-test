import 'package:reyy_cinema/features/seat_select/models/seat_item_model.dart';

class SeatMapResult {
  const SeatMapResult({
    required this.rows,
    this.serviceFee = 3000,
  });

  final List<SeatRowModel> rows;
  final int serviceFee;

  factory SeatMapResult.fromJson(Map<String, dynamic> json) {
    final rowsJson = json['rows'];
    return SeatMapResult(
      serviceFee: json['service_fee'] is num
          ? (json['service_fee'] as num).toInt()
          : int.tryParse('${json['service_fee'] ?? json['serviceFee']}') ?? 3000,
      rows: rowsJson is List
          ? rowsJson
                .map(
                  (item) => SeatRowModel.fromJson(
                    (item as Map).cast<String, dynamic>(),
                  ),
                )
                .toList()
          : const [],
    );
  }
}
