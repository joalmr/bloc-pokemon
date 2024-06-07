import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:pokemon/core/error/failures.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/features/pokemon/domain/repositories/pokemons_repository.dart';

class CapturePokemonUsecase {
  final PokemonsRepository repository;

  CapturePokemonUsecase({required this.repository});

  Future<Either<Failure, bool>> call(Pokemon pokemon) {
    log(
      {pokemon.id, pokemon.name, pokemon.image}.toString(),
      name: 'Capture Pokemon Usecase',
    );
    return repository.capturePokemon(pokemon);
  }
}
