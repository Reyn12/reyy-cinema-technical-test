import 'package:reyy_cinema/features/buy_ticket/models/buy_ticket_cinema_model.dart';

class BuyTicketSchedulesResult {
  const BuyTicketSchedulesResult({
    required this.formats,
    required this.cinemas,
    this.filmFormats = const [],
  });

  final List<String> formats;
  final List<BuyTicketCinemaModel> cinemas;
  final List<String> filmFormats;

  factory BuyTicketSchedulesResult.fromJson(Map<String, dynamic> json) {
    final formatsJson = json['formats'];
    final filmFormatsJson = json['film_formats'] ?? json['filmFormats'];
    final cinemasJson = json['cinemas'];

    return BuyTicketSchedulesResult(
      formats: formatsJson is List
          ? formatsJson.map((e) => e.toString()).toList()
          : const [],
      filmFormats: filmFormatsJson is List
          ? filmFormatsJson.map((e) => e.toString()).toList()
          : const [],
      cinemas: cinemasJson is List
          ? cinemasJson
                .map(
                  (item) => BuyTicketCinemaModel.fromJson(
                    (item as Map).cast<String, dynamic>(),
                  ),
                )
                .toList()
          : const [],
    );
  }
}
