class FaqItemModel {
  const FaqItemModel({
    this.id,
    this.question,
    this.answer,
  });

  final String? id;
  final String? question;
  final String? answer;

  factory FaqItemModel.fromJson(Map<String, dynamic> json) {
    return FaqItemModel(
      id: json['id']?.toString(),
      question: json['question']?.toString(),
      answer: json['answer']?.toString(),
    );
  }
}
