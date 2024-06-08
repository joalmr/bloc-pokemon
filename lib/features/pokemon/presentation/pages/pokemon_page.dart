import 'package:flutter/material.dart';
import 'package:pokemon/features/pokemon/presentation/bloc/search_pokemon/search_pokemon_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/pokemon/presentation/pages/views/pokemon_failure.dart';
import 'package:pokemon/features/pokemon/presentation/pages/views/pokemon_initial.dart';
import 'package:pokemon/features/pokemon/presentation/pages/views/pokemon_list.dart';
import 'package:pokemon/features/pokemon/presentation/pages/views/pokemon_success.dart';

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
              return const PokemonInitial();
            case SearchPokemonSuccess():
              return const PokemonSuccess();
            case SearchPokemonList():
              return const PokemonList();
            case SearchPokemonFailure():
              return const PokemonFailure();
          }
        },
      ),
    );
  }
}
