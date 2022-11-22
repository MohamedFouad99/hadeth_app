// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Hadith {
  String? key;
  String? nameHadith;
  String? textHadith;
  String? explanationHadith;
  String? translateNarrator;
  String? audioHadith;
  Hadith({
    this.key,
    this.nameHadith,
    this.textHadith,
    this.explanationHadith,
    this.translateNarrator,
    this.audioHadith,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'key': key,
      'nameHadith': nameHadith,
      'textHadith': textHadith,
      'explanationHadith': explanationHadith,
      'translateNarrator': translateNarrator,
      'audioHadith': audioHadith,
    };
  }

  factory Hadith.fromMap(Map<String, dynamic> map) {
    return Hadith(
      key: map['key'] as String,
      nameHadith: map['nameHadith'] as String,
      textHadith: map['textHadith'] as String,
      explanationHadith: map['explanationHadith'] as String,
      translateNarrator: map['translateNarrator'] as String,
      audioHadith: map['audioHadith'] as String,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Hadith.fromJson(String source) => Hadith.fromMap(json.decode(source) as Map<String, dynamic>);
}
