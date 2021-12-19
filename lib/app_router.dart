import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubit/characters_cubit.dart';
import 'data/models/characters.dart';
import 'data/repository/characters_repository.dart';
import 'data/services/characters_services.dart';
import 'presentation/screens/characters_details_screen.dart';
import 'presentation/screens/characters_screen.dart';

class Routes {
  static const String charactersRoute = '/';
  static const String characterDetailsRoute = '/character_details';
}

class AppRouter {
  late BaseCharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  AppRouter() {
    charactersRepository = CharactersRepository(CharactersServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route<dynamic>? genrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.charactersRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );
      case Routes.characterDetailsRoute:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => CharactersCubit(charactersRepository),
            child: CharacterDetailsScreen(character: character),
          ),
        );
    }
  }
}
