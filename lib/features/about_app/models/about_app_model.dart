class AboutAppContactModel {
  const AboutAppContactModel({
    this.label,
    this.value,
  });

  final String? label;
  final String? value;

  factory AboutAppContactModel.fromJson(Map<String, dynamic> json) {
    return AboutAppContactModel(
      label: json['label']?.toString(),
      value: json['value']?.toString(),
    );
  }
}

class AboutAppModel {
  const AboutAppModel({
    this.appName,
    this.version,
    this.description,
    this.contacts,
  });

  final String? appName;
  final String? version;
  final String? description;
  final List<AboutAppContactModel>? contacts;

  factory AboutAppModel.fromJson(Map<String, dynamic> json) {
    final contactsJson = json['contacts'];

    return AboutAppModel(
      appName: json['app_name']?.toString(),
      version: json['version']?.toString(),
      description: json['description']?.toString(),
      contacts: contactsJson is List
          ? contactsJson
                .map(
                  (item) => AboutAppContactModel.fromJson(
                    item as Map<String, dynamic>,
                  ),
                )
                .toList()
          : null,
    );
  }

  AboutAppModel copyWith({
    String? appName,
    String? version,
    String? description,
    List<AboutAppContactModel>? contacts,
  }) {
    return AboutAppModel(
      appName: appName ?? this.appName,
      version: version ?? this.version,
      description: description ?? this.description,
      contacts: contacts ?? this.contacts,
    );
  }
}
