import 'package:rickandmortyapi/shared/models/character.dart';
import 'package:rickandmortyapi/shared/models/info.dart';

class Datum {
  final Info info;
  final List<Character> characters;

  Datum({
    required this.info,
    required this.characters,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      info: Info.fromJson(json['info']),
      characters: List<dynamic>.from(json['results'])
          .map((e) => Character.fromJson(e))
          .toList(),
    );
  }
}
