import 'dart:convert';

Pokemon pokemonFromJson(String str) {
  final jsonData = json.decode(str);
  return Pokemon.fromJson(jsonData);
}

class Pokemon {
  String name;
  String url;

  Pokemon({this.name, this.url});

  factory Pokemon.fromJson(Map<String, dynamic> json){
    return Pokemon(
      name : json['name'],
      url: json['url']
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'url' : url
  };

  Map<String, dynamic> toMap() => {
    'name': name,
    'url' : url
  };
}