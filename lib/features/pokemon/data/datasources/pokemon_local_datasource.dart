import 'dart:developer';

import 'package:pokemon/core/error/failures.dart';
import 'package:pokemon/features/pokemon/data/models/pokemon_model.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class PokemonLocalDatasource {
  Future<bool> capturePokemon(Pokemon pokemon);
  Future<List<PokemonModel>> getCapturedPokemonsList();
}

class HivePokemonLocalDatasourceImpl extends PokemonLocalDatasource {
  HivePokemonLocalDatasourceImpl() {
    Hive.initFlutter();
  }

  @override
  Future<bool> capturePokemon(Pokemon pokemon) async {
    try {
      Box<dynamic> box = await Hive.openBox('pokemons');

      box.put(pokemon.id, PokemonModel.fromEntity(pokemon).toJson());

      return true;
    } catch (e) {
      log(e.toString(), name: 'Local Failure');
      throw LocalFailure();
    }
  }

  @override
  Future<List<PokemonModel>> getCapturedPokemonsList() async {
    try {
      Box<dynamic> box = await Hive.openBox('pokemons');

      return box.values.map((poke) => PokemonModel.fromJson(poke)).toList();
    } catch (e) {
      log(e.toString(), name: 'Local Failure');
      throw LocalFailure();
    }
  }
}
