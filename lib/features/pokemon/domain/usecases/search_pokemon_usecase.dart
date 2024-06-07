import 'package:dartz/dartz.dart';
import 'package:pokemon/core/error/failures.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/features/pokemon/domain/repositories/pokemons_repository.dart';

class SearchPokemonUsecase {
  final PokemonsRepository repository;

  SearchPokemonUsecase({required this.repository});

  Future<Either<Failure, Pokemon>> call(int id) {
    return repository.getPokemon(id);
  }
}
