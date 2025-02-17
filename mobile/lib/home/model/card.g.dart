// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Card _$CardFromJson(Map<String, dynamic> json) => Card(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      player: json['player'] as String,
      team: json['team'] as String,
      year: (json['year'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'player': instance.player,
      'team': instance.team,
      'year': instance.year,
      'imageUrl': instance.imageUrl,
    };
