import 'dart:convert';

TopClan topClanFromJson(String str) {
  final jsonData = json.decode(str);
  return TopClan.fromJson(jsonData);
}

class TopClan {
  String tag;
  String name;
  int score;
  int memberCount;
  int rank;
  int previousRank;


  TopClan({this.tag, this.name, this.score, this.memberCount, this.rank, this.previousRank});

  factory TopClan.fromJson(Map<String, dynamic> json){
    return TopClan(
      tag : json['tag'],
      name : json['name'],
      score : json['score'],
      memberCount : json['memberCount'],
      rank : json['rank'],
      previousRank : json['previousRank'],
    );
  }

  Map<String, dynamic> toJson() => {
    'tag': tag,
    'name': name,
    'score': score,
    'memberCount': memberCount,
    'rank': rank,
    'previousRank': previousRank,
  };

  Map<String, dynamic> toMap() => {
    "tag": tag,
    "name": name,
    "score": score,
    "memberCount": memberCount,
    "rank": rank,
    "previousRank": previousRank,
  };
}