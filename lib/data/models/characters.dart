List<Character> charactersFromJson(List characters) => List<Character>.from(
      characters.map(
        (character) => Character.fromJson(character),
      ),
    );

class Character {
  Character({
    required this.charId,
    required this.name,
    required this.birthday,
    required this.occupation,
    required this.img,
    required this.status,
    required this.nickname,
    required this.appearance,
    required this.portrayed,
    required this.category,
    required this.betterCallSaulAppearance,
  });

  final int charId;
  final String name;
  final String birthday;
  final List<String> occupation;
  final String img;
  final String status;
  final String nickname;
  final List<int> appearance;
  final String portrayed;
  final String category;
  final List<dynamic> betterCallSaulAppearance;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        charId: json['char_id'],
        name: json['name'],
        birthday: json['birthday'],
        occupation: List<String>.from(json['occupation'].map((x) => x)),
        img: json['img'],
        status: json['status'],
        nickname: json['nickname'],
        appearance: List<int>.from(json['appearance'].map((x) => x)),
        portrayed: json['portrayed'],
        category: json['category'],
        betterCallSaulAppearance: List<dynamic>.from(
            json['better_call_saul_appearance'].map((x) => x)),
      );
}
