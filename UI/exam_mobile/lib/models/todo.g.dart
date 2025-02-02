// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToDo4924 _$ToDo4924FromJson(Map<String, dynamic> json) => ToDo4924(
      (json['korisnikId'] as num?)?.toInt(),
      json['ime'] as String?,
      json['prezime'] as String?,
      json['nazivAktivnosti'] as String?,
      json['opisAktivnosti'] as String?,
      json['krajnjiRok'] == null
          ? null
          : DateTime.parse(json['krajnjiRok'] as String),
      json['statusAktivnosti'] as String?,
    );

Map<String, dynamic> _$ToDo4924ToJson(ToDo4924 instance) => <String, dynamic>{
      'korisnikId': instance.korisnikId,
      'ime': instance.ime,
      'prezime': instance.prezime,
      'nazivAktivnosti': instance.nazivAktivnosti,
      'opisAktivnosti': instance.opisAktivnosti,
      'krajnjiRok': instance.krajnjiRok?.toIso8601String(),
      'statusAktivnosti': instance.statusAktivnosti,
    };
