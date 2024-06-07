import 'package:pokemon/features/pokemon/data/models/pokemon_model.dart';
import 'package:dio/dio.dart';

abstract class PokemonRemoteDatasource {
  Future<PokemonModel> getPokemon(int id);
}

class PokemonRemoteDatasourceImpl implements PokemonRemoteDatasource {
  final Dio dio = Dio();

  @override
  Future<PokemonModel> getPokemon(int id) async {
    final response = await dio.get('https://pokeapi.co/api/v2/pokemon/$id');

    return PokemonModel.fromJson(response.data);
  }
}
