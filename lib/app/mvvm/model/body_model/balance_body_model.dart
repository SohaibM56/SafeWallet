// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class BalanceBody {
  final Color color;
  final String title;
  BalanceBody({required this.color, required this.title});

  BalanceBody copyWith({Color? color, String? title}) {
    return BalanceBody(color: color ?? this.color, title: title ?? this.title);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'color': color.value, 'title': title};
  }

  factory BalanceBody.fromMap(Map<String, dynamic> map) {
    return BalanceBody(
      color: Color(map['color'] as int),
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BalanceBody.fromJson(String source) =>
      BalanceBody.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BalanceBody(color: $color, title: $title)';

  @override
  bool operator ==(covariant BalanceBody other) {
    if (identical(this, other)) return true;

    return other.color == color && other.title == title;
  }

  @override
  int get hashCode => color.hashCode ^ title.hashCode;
}
