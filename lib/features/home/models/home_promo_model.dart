class HomePromoModel {
  const HomePromoModel({
    required this.title,
    required this.description,
    required this.buttonText,
  });

  final String title;
  final String description;
  final String buttonText;

  factory HomePromoModel.fromJson(Map<String, dynamic> json) {
    return HomePromoModel(
      title: (json['title'] ?? '').toString(),
      description: (json['description'] ?? '').toString(),
      buttonText: (json['button_text'] ?? json['buttonText'] ?? 'Klaim Promo')
          .toString(),
    );
  }
}
