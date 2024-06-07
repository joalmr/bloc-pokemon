import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemon/core/error/failures.dart';
import 'package:pokemon/core/utils/utils.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/features/pokemon/domain/usecases/capture_pokemon_usecase.dart';
import 'package:pokemon/features/pokemon/domain/usecases/get_captured_pokemons_usecase.dart';
import 'package:pokemon/features/pokemon/domain/usecases/search_pokemon_usecase.dart';

part 'search_pokemon_event.dart';
part 'search_pokemon_state.dart';

class SearchPokemonBloc extends Bloc<SearchPokemonEvent, SearchPokemonState> {
  final CapturePokemonUsecase _capturePokemonUsecase;
  final GetCapturedPokemonsUsecase _getCapturedPokemonsUsecase;
  final SearchPokemonUsecase _searchPokemonUsecase;

  SearchPokemonBloc(
    this._capturePokemonUsecase,
    this._getCapturedPokemonsUsecase,
    this._searchPokemonUsecase,
  ) : super(SearchPokemonInitial()) {
    on<OnSearchPokemon>((event, emit) async {
      emit(SearchPokemonLoading());

      final response = await _searchPokemonUsecase(randomPokemonId);

      response.fold(
        (l) => emit(SearchPokemonFailure(failure: l)),
        (r) => emit(SearchPokemonSuccess(pokemon: r)),
      );
    });
    on<OnCapturePokemon>((event, emit) async {
      // emit(SearchPokemonLoading());

      final response = await _capturePokemonUsecase(event.pokemon);

      response.fold(
        (l) => emit(SearchPokemonFailure(failure: l)),
        (r) {},
        // => emit(SearchPokemonInitial())
      );
    });
    on<OnGetCapturedPokemons>((event, emit) async {
      final response = await _getCapturedPokemonsUsecase();

      response.fold(
        (l) => emit(SearchPokemonFailure(failure: l)),
        (r) => emit(SearchPokemonList(pokemons: r)),
      );
    });
  }
}
