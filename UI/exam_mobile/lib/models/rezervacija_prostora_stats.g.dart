// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rezervacija_prostora_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RezervacijaProstoraStats _$RezervacijaProstoraStatsFromJson(
        Map<String, dynamic> json) =>
    RezervacijaProstoraStats(
      json['statusRezervacije'] as String?,
      (json['brojPojavljivanja'] as num).toInt(),
    );

Map<String, dynamic> _$RezervacijaProstoraStatsToJson(
        RezervacijaProstoraStats instance) =>
    <String, dynamic>{
      'statusRezervacije': instance.statusRezervacije,
      'brojPojavljivanja': instance.brojPojavljivanja,
    };
