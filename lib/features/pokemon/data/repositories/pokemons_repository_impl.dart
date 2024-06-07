import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pokemon/core/error/failures.dart';
import 'package:pokemon/features/pokemon/data/datasources/pokemon_local_datasource.dart';
import 'package:pokemon/features/pokemon/data/datasources/pokemon_remote_datasource.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/features/pokemon/domain/repositories/pokemons_repository.dart';

class PokemonsRepositoryImpl implements PokemonsRepository {
  final PokemonLocalDatasource pokemonLocalDatasource;
  final PokemonRemoteDatasource pokemonRemoteDatasource;

  PokemonsRepositoryImpl({
    required this.pokemonLocalDatasource,
    required this.pokemonRemoteDatasource,
  });

  @override
  Future<Either<Failure, bool>> capturePokemon(Pokemon pokemon) async {
    try {
      log(
        {pokemon.id, pokemon.name, pokemon.image}.toString(),
        name: 'Capture Pokemon Repository',
      );
      final bool response =
          await pokemonLocalDatasource.capturePokemon(pokemon);
      return Right(response);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<Pokemon>>> getCapturedPokemons() async {
    try {
      final List<Pokemon> response =
          await pokemonLocalDatasource.getCapturedPokemonsList();
      return Right(response);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, Pokemon>> getPokemon(int id) async {
    try {
      final Pokemon response = await pokemonRemoteDatasource.getPokemon(id);
      return Right(response);
    } on DioException {
      return Left(ServerFailure());
    }
  }
}
