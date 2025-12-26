import 'dart:convert';

class LanguageBodyModel {
  String language;
  String imageUrl;
  LanguageBodyModel({required this.language, required this.imageUrl});

  LanguageBodyModel copyWith({String? language, String? imageUrl}) {
    return LanguageBodyModel(
      language: language ?? this.language,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'language': language, 'imageUrl': imageUrl};
  }

  factory LanguageBodyModel.fromMap(Map<String, dynamic> map) {
    return LanguageBodyModel(
      language: map['language'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LanguageBodyModel.fromJson(String source) =>
      LanguageBodyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LanguageBodyModel(language: $language, imageUrl: $imageUrl)';

  @override
  bool operator ==(covariant LanguageBodyModel other) {
    if (identical(this, other)) return true;

    return other.language == language && other.imageUrl == imageUrl;
  }

  @override
  int get hashCode => language.hashCode ^ imageUrl.hashCode;
}
