import 'package:get_it/get_it.dart';
import 'package:pokemon/features/pokemon/data/datasources/pokemon_local_datasource.dart';
import 'package:pokemon/features/pokemon/data/datasources/pokemon_remote_datasource.dart';
import 'package:pokemon/features/pokemon/data/repositories/pokemons_repository_impl.dart';
import 'package:pokemon/features/pokemon/domain/repositories/pokemons_repository.dart';
import 'package:pokemon/features/pokemon/domain/usecases/capture_pokemon_usecase.dart';
import 'package:pokemon/features/pokemon/domain/usecases/get_captured_pokemons_usecase.dart';
import 'package:pokemon/features/pokemon/domain/usecases/search_pokemon_usecase.dart';
import 'package:pokemon/features/pokemon/presentation/bloc/search_pokemon/search_pokemon_bloc.dart';

final di = GetIt.instance;

Future<void> init() async {
  //bloc
  di.registerFactory(() => SearchPokemonBloc(di(), di(), di()));
  //usecase
  di.registerLazySingleton(() => CapturePokemonUsecase(repository: di()));
  di.registerLazySingleton(() => GetCapturedPokemonsUsecase(repository: di()));
  di.registerLazySingleton(() => SearchPokemonUsecase(repository: di()));
  //repository
  di.registerLazySingleton<PokemonsRepository>(() => PokemonsRepositoryImpl(
        pokemonLocalDatasource: di(),
        pokemonRemoteDatasource: di(),
      ));
  //data source
  di.registerLazySingleton<PokemonLocalDatasource>(
    () => HivePokemonLocalDatasourceImpl(),
  );
  di.registerLazySingleton<PokemonRemoteDatasource>(
    () => PokemonRemoteDatasourceImpl(),
  );
}
