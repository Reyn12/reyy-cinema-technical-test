class HomeBannerModel {
  const HomeBannerModel({
    required this.id,
    required this.imagePath,
  });

  final String id;
  final String imagePath;

  factory HomeBannerModel.fromJson(Map<String, dynamic> json) {
    return HomeBannerModel(
      id: (json['id'] ?? '').toString(),
      imagePath: (json['image_path'] ?? json['imagePath'] ?? '').toString(),
    );
  }
}
