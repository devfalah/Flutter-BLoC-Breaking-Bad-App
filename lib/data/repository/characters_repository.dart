import '../models/characters.dart';
import '../models/quote.dart';
import '../services/characters_services.dart';

abstract class BaseCharactersRepository {
  Future<List<Character>> getAllCharacters();
  Future<List<Quote>> getCharacterQuotes(String charName);
}

class CharactersRepository implements BaseCharactersRepository {
  final CharactersServices _charactersServices;

  CharactersRepository(this._charactersServices);
  @override
  Future<List<Character>> getAllCharacters() async {
    final characters = await _charactersServices.getAllCharacters();
    return charactersFromJson(characters);
  }

  @override
  Future<List<Quote>> getCharacterQuotes(String charName) async {
    final quotes = await _charactersServices.getCharacterQuotes(charName);
    return quotes.map((charQuotes) => Quote.fromJson(charQuotes)).toList();
  }
}
