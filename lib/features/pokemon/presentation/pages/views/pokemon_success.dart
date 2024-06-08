import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/pokemon/presentation/bloc/search_pokemon/search_pokemon_bloc.dart';
import 'package:pokemon/features/pokemon/presentation/widgets/pokemon_card.dart';

class PokemonSuccess extends StatelessWidget {
  const PokemonSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SearchPokemonBloc>(context);
    final blocState = bloc.state as SearchPokemonSuccess;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PokemonCard(pokemon: blocState.pokemon),
          TextButton(
              onPressed: () => bloc.add(OnSearchPokemon()),
              style: ButtonStyle(
                foregroundColor:
                    WidgetStateProperty.all(const Color(0xFF999999)),
              ),
              child: const Text('Buscar otro pokemon')),
          TextButton(
              onPressed: () => bloc.add(OnGetCapturedPokemons()),
              style: ButtonStyle(
                foregroundColor:
                    WidgetStateProperty.all(const Color(0xFF999999)),
              ),
              child: const Text('Ver mis pokemones capturados')),
          TextButton(
              onPressed: () {
                bloc.add(OnCapturePokemon(pokemon: blocState.pokemon));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Color(0xFF001900),
                    content: Text('Pokemon capturado'),
                  ),
                );
              },
              style: ButtonStyle(
                foregroundColor:
                    WidgetStateProperty.all(const Color(0xFF999999)),
              ),
              child: Text(
                  'Capturar a ${blocState.pokemon.name.substring(0, 1).toUpperCase() + blocState.pokemon.name.substring(1)}'))
        ],
      ),
    );
  }
}
