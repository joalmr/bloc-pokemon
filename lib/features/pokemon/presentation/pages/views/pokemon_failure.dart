import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/pokemon/presentation/bloc/search_pokemon/search_pokemon_bloc.dart';

class PokemonFailure extends StatelessWidget {
  const PokemonFailure({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SearchPokemonBloc>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
              'Ah ocurrido un error, que te parece si lo intentamos de nuevo?'),
          TextButton(
              onPressed: () => bloc.add(OnSearchPokemon()),
              style: ButtonStyle(
                foregroundColor:
                    WidgetStateProperty.all(const Color(0xFF999999)),
              ),
              child: const Text('Volver y buscar pokemon'))
        ],
      ),
    );
  }
}
