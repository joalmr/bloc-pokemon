import 'package:dartz/dartz.dart';
import 'package:pokemon/core/error/failures.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/features/pokemon/domain/repositories/pokemons_repository.dart';

class GetCapturedPokemonsUsecase {
  final PokemonsRepository repository;
  GetCapturedPokemonsUsecase({required this.repository});

  Future<Either<Failure, List<Pokemon>>> call() {
    return repository.getCapturedPokemons();
  }
}
