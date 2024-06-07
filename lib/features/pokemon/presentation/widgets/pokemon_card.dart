import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Color(0xFF444444),
        // borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          SvgPicture.network(
            width: 140,
            height: 140,
            fit: BoxFit.scaleDown,
            pokemon.image,
          ),
          Text(
            pokemon.name.substring(0, 1).toUpperCase() +
                pokemon.name.substring(1),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
