// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rezervacija_prostora.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RezervacijaProstora _$RezervacijaProstoraFromJson(Map<String, dynamic> json) =>
    RezervacijaProstora(
      json['ime'] as String?,
      json['prezime'] as String?,
      json['oznaka'] as String?,
      (json['kapacitet'] as num?)?.toInt(),
      DateTime.parse(json['datumIVrijemePocetkaRezervacije'] as String),
      (json['trajanje'] as num).toInt(),
      json['statusRezervacije'] as String?,
      (json['korisnikId'] as num?)?.toInt(),
      (json['radniProstorId'] as num?)?.toInt(),
      json['napomena'] as String?,
    );

Map<String, dynamic> _$RezervacijaProstoraToJson(
        RezervacijaProstora instance) =>
    <String, dynamic>{
      'ime': instance.ime,
      'prezime': instance.prezime,
      'oznaka': instance.oznaka,
      'kapacitet': instance.kapacitet,
      'datumIVrijemePocetkaRezervacije':
          instance.datumIVrijemePocetkaRezervacije.toIso8601String(),
      'trajanje': instance.trajanje,
      'statusRezervacije': instance.statusRezervacije,
      'korisnikId': instance.korisnikId,
      'radniProstorId': instance.radniProstorId,
      'napomena': instance.napomena,
    };
