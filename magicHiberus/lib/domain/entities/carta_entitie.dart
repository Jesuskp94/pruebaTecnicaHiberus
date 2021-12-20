class Card {
  String name;
  String manaCost;
  int cmc;
  String type;
  String rarity;
  String set;
  String setName;
  String text;
  String flavor;
  String artist;
  String number;
  String power;
  String toughness;
  String layout;
  String imageUrl;

  Card({
    required this.name,
    required this.manaCost,
    required this.cmc,
    required this.type,
    required this.rarity,
    required this.set,
    required this.setName,
    required this.text,
    required this.flavor,
    required this.artist,
    required this.number,
    required this.power,
    required this.toughness,
    required this.layout,
    required this.imageUrl,
  });

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      name: json['name'] as String,
      manaCost: json['manaCost'] as String,
      cmc: json['cmc'] as int,
      type: json['type'] as String,
      rarity: json['rarity'] as String,
      set: json['set'] as String,
      setName: json['setName'] as String,
      text: json['text'] as String,
      flavor: json['flavor'] as String,
      artist: json['artist'] as String,
      number: json['number'] as String,
      power: json['power'] as String,
      toughness: json['toughness'] as String,
      layout: json['layout'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }
}