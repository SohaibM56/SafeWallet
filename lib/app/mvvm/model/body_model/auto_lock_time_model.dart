import 'dart:convert';

class AutoLockBodyModel {
  String timeLabel;
  String imageUrl;
  
  AutoLockBodyModel({
    required this.timeLabel, 
    required this.imageUrl,
  });

  AutoLockBodyModel copyWith({
    String? timeLabel, 
    String? imageUrl,
  }) {
    return AutoLockBodyModel(
      timeLabel: timeLabel ?? this.timeLabel,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'timeLabel': timeLabel, 
      'imageUrl': imageUrl,
    };
  }

  factory AutoLockBodyModel.fromMap(Map<String, dynamic> map) {
    return AutoLockBodyModel(
      timeLabel: map['timeLabel'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AutoLockBodyModel.fromJson(String source) =>
      AutoLockBodyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AutoLockBodyModel(timeLabel: $timeLabel, imageUrl: $imageUrl)';

  @override
  bool operator ==(covariant AutoLockBodyModel other) {
    if (identical(this, other)) return true;

    return other.timeLabel == timeLabel && other.imageUrl == imageUrl;
  }

  @override
  int get hashCode => timeLabel.hashCode ^ imageUrl.hashCode;
}