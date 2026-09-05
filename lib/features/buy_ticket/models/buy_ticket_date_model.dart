class BuyTicketDateModel {
  const BuyTicketDateModel({
    required this.date,
    required this.dayName,
    required this.dayNumber,
    required this.subLabel,
  });

  final DateTime date;
  final String dayName;
  final String dayNumber;
  final String subLabel;
}
