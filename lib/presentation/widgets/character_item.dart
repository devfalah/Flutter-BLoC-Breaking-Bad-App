import '../../app_router.dart';
import '../../constants/app_assets.dart';
import '../../constants/my_colors.dart';
import 'package:block_sm/data/models/characters.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        Routes.characterDetailsRoute,
        arguments: character,
      ),
      child: Hero(
        tag: character.charId,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: GridTile(
            child: FadeInImage.assetNetwork(
              width: double.infinity,
              height: double.infinity,
              image: character.img,
              placeholder: AppAssets.loading,
              fit: BoxFit.cover,
            ),
            footer: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                character.name,
                style: const TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
