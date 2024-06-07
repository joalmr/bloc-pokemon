import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          // Image.network(pokemon.image),
          SvgPicture.network(
            height: 150,
            width: 150,
            fit: BoxFit.cover,
            pokemon.image,
          ),
          Text(pokemon.name),
        ],
      ),
    );
  }
}
