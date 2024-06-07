import 'package:pokemon/features/pokemon/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  PokemonModel({
    required super.id,
    required super.name,
    required super.image,
  });

  factory PokemonModel.fromJson(json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      image: json['sprites']['other']['dream_world']['front_default'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'sprites': {
        'other': {
          'dream_world': {
            'front_default': image,
          }
        }
      },
    };
  }

  factory PokemonModel.fromEntity(Pokemon pokemon) {
    return PokemonModel(
      id: pokemon.id,
      name: pokemon.name,
      image: pokemon.image,
    );
  }
}
