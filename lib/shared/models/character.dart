import 'package:rickandmortyapi/shared/models/location.dart';
import 'package:rickandmortyapi/shared/models/origin.dart';

class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Origin? origin;
  final Location? location;
  final String image;
  final List<String>? episode;
  final String url;
  final String created;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    this.origin,
    this.location,
    required this.image,
    this.episode,
    this.url = '',
    this.created = '',
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'] ?? '',
      status: json['status'] ?? '',
      species: json['species'] ?? '',
      type: json['type'] ?? '',
      gender: json['gender'] ?? '',
      origin: Origin.fromJson(json['origin']),
      location: Location.fromJson(json['location']),
      image: json['image'] ?? '',
      episode: List<String>.from(json['episode']),
      url: json['url'] ?? '',
      created: json['created'] ?? '',
    );
  }

  factory Character.zero() {
    return Character(
      id: 0,
      name: '',
      status: '',
      species: '',
      type: '',
      gender: '',
      image: '',
    );
  }
}

// {
//   "id": 361,
//   "name": "Toxic Rick",
//   "status": "Dead",
//   "species": "Humanoid",
//   "type": "Rick's Toxic Side",
//   "gender": "Male",
//   "origin": {
//     "name": "Alien Spa",
//     "url": "https://rickandmortyapi.com/api/location/64"
//   },
//   "location": {
//     "name": "Earth",
//     "url": "https://rickandmortyapi.com/api/location/20"
//   },
//   "image": "https://rickandmortyapi.com/api/character/avatar/361.jpeg",
//   "episode": [
//     "https://rickandmortyapi.com/api/episode/27"
//   ],
//   "url": "https://rickandmortyapi.com/api/character/361",
//   "created": "2018-01-10T18:20:41.703Z"
// },