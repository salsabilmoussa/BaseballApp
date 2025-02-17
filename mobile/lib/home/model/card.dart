import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'card.g.dart';

@JsonSerializable(explicitToJson: true)
@immutable
class Card {
  const Card(
      {this.id,
      required this.name,
      required this.player,
      required this.team,
      required this.year,
      required this.imageUrl});

  final int? id;
  final String name;
  final String player;
  final String team;
  final int year;
  final String imageUrl;

  @override
  String toString() {
    return 'Card(name: $name, player: $player, team: $team, year : $year, imageUrl: $imageUrl)';
  }

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);

  Map<String, dynamic> toJson() => _$CardToJson(this);
}
