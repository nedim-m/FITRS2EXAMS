// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fitpasos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fitpasos _$FitpasosFromJson(Map<String, dynamic> json) => Fitpasos(
      (json['fitPasosId'] as num?)?.toInt(),
      (json['korisnikId'] as num?)?.toInt(),
      json['aktivan'] as bool,
      DateTime.parse(json['datumVazenja'] as String),
      json['ime'] as String?,
      json['prezime'] as String?,
    );

Map<String, dynamic> _$FitpasosToJson(Fitpasos instance) => <String, dynamic>{
      'fitPasosId': instance.fitPasosId,
      'korisnikId': instance.korisnikId,
      'aktivan': instance.aktivan,
      'datumVazenja': instance.datumVazenja.toIso8601String(),
      'ime': instance.ime,
      'prezime': instance.prezime,
    };
