import 'package:flutter/material.dart';
import 'package:pokemon/features/pokemon/presentation/bloc/search_pokemon/search_pokemon_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/pokemon/presentation/widgets/pokemon_card.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchPokemonBloc, SearchPokemonState>(
        builder: (context, state) {
          switch (state) {
            case SearchPokemonLoading():
              return const Center(child: CircularProgressIndicator());
            case SearchPokemonInitial():
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () =>
                            BlocProvider.of<SearchPokemonBloc>(context)
                                .add(OnSearchPokemon()),
                        style: ButtonStyle(
                          foregroundColor:
                              WidgetStateProperty.all(const Color(0xFF999999)),
                        ),
                        child: const Text('Buscar pokemon')),
                    TextButton(
                        onPressed: () =>
                            BlocProvider.of<SearchPokemonBloc>(context)
                                .add(OnGetCapturedPokemons()),
                        style: ButtonStyle(
                          foregroundColor:
                              WidgetStateProperty.all(const Color(0xFF999999)),
                        ),
                        child: const Text('Ver mis pokemones capturados'))
                  ],
                ),
              );
            case SearchPokemonSuccess():
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PokemonCard(pokemon: state.pokemon),
                    TextButton(
                        onPressed: () =>
                            BlocProvider.of<SearchPokemonBloc>(context)
                                .add(OnSearchPokemon()),
                        style: ButtonStyle(
                          foregroundColor:
                              WidgetStateProperty.all(const Color(0xFF999999)),
                        ),
                        child: const Text('Buscar otro pokemon')),
                    TextButton(
                        onPressed: () =>
                            BlocProvider.of<SearchPokemonBloc>(context)
                                .add(OnGetCapturedPokemons()),
                        style: ButtonStyle(
                          foregroundColor:
                              WidgetStateProperty.all(const Color(0xFF999999)),
                        ),
                        child: const Text('Ver mis pokemones capturados')),
                    TextButton(
                        onPressed: () {
                          BlocProvider.of<SearchPokemonBloc>(context)
                              .add(OnCapturePokemon(pokemon: state.pokemon));
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
                            'Capturar a ${state.pokemon.name.substring(0, 1).toUpperCase() + state.pokemon.name.substring(1)}'))
                  ],
                ),
              );
            case SearchPokemonList():
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      children: state.pokemons
                          .map((p) => PokemonCard(pokemon: p))
                          .toList(),
                    ),
                  ),
                  TextButton(
                    onPressed: () => BlocProvider.of<SearchPokemonBloc>(context)
                        .add(OnSearchPokemon()),
                    style: ButtonStyle(
                      foregroundColor:
                          WidgetStateProperty.all(const Color(0xFF999999)),
                    ),
                    child: const Text('Volver y buscar pokemon'),
                  ),
                  const SizedBox(height: 30),
                ],
              );
            case SearchPokemonFailure():
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                        'Ah ocurrido un error, que te parece si lo intentamos de nuevo?'),
                    TextButton(
                        onPressed: () =>
                            BlocProvider.of<SearchPokemonBloc>(context)
                                .add(OnSearchPokemon()),
                        style: ButtonStyle(
                          foregroundColor:
                              WidgetStateProperty.all(const Color(0xFF999999)),
                        ),
                        child: const Text('Volver y buscar pokemon'))
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
