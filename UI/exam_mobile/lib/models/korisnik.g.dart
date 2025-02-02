// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'korisnik.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Korisnik _$KorisnikFromJson(Map<String, dynamic> json) => Korisnik(
      (json['korisnikId'] as num?)?.toInt(),
      json['ime'] as String?,
      json['prezime'] as String?,
      json['korisnickoIme'] as String?,
      json['email'] as String?,
      json['telefon'] as String?,
      json['addresa'] as String?,
      (json['ulogaId'] as num?)?.toInt(),
      json['status'] as bool?,
      json['uloga'] as String?,
    );

Map<String, dynamic> _$KorisnikToJson(Korisnik instance) => <String, dynamic>{
      'korisnikId': instance.korisnikId,
      'ime': instance.ime,
      'prezime': instance.prezime,
      'korisnickoIme': instance.korisnickoIme,
      'email': instance.email,
      'telefon': instance.telefon,
      'addresa': instance.addresa,
      'status': instance.status,
      'uloga': instance.uloga,
      'ulogaId': instance.ulogaId,
    };
