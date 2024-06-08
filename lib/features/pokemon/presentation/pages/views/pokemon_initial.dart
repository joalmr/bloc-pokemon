import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/pokemon/presentation/bloc/search_pokemon/search_pokemon_bloc.dart';

class PokemonInitial extends StatelessWidget {
  const PokemonInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () => BlocProvider.of<SearchPokemonBloc>(context)
                  .add(OnSearchPokemon()),
              style: ButtonStyle(
                foregroundColor:
                    WidgetStateProperty.all(const Color(0xFF999999)),
              ),
              child: const Text('Buscar pokemon')),
          TextButton(
              onPressed: () => BlocProvider.of<SearchPokemonBloc>(context)
                  .add(OnGetCapturedPokemons()),
              style: ButtonStyle(
                foregroundColor:
                    WidgetStateProperty.all(const Color(0xFF999999)),
              ),
              child: const Text('Ver mis pokemones capturados'))
        ],
      ),
    );
  }
}
