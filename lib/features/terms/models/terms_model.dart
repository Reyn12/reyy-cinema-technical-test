class TermsModel {
  const TermsModel({this.htmlContent});

  final String? htmlContent;

  factory TermsModel.fromJson(Map<String, dynamic> json) {
    return TermsModel(htmlContent: json['html_content']?.toString());
  }
}
