import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/pokemon/presentation/bloc/search_pokemon/search_pokemon_bloc.dart';
import 'package:pokemon/features/pokemon/presentation/widgets/pokemon_card.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SearchPokemonBloc>(context);
    final blocState = bloc.state as SearchPokemonList;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            children:
                blocState.pokemons.map((p) => PokemonCard(pokemon: p)).toList(),
          ),
        ),
        TextButton(
          onPressed: () => BlocProvider.of<SearchPokemonBloc>(context)
              .add(OnSearchPokemon()),
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(const Color(0xFF999999)),
          ),
          child: const Text('Volver y buscar pokemon'),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
