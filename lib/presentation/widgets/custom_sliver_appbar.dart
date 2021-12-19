import '../../constants/my_colors.dart';
import '../../data/models/characters.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: AppColors.grey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.nickname,
          style: const TextStyle(color: AppColors.white),
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(
            character.img,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
