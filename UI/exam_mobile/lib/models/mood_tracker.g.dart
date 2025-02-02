// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_tracker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoodTracker _$MoodTrackerFromJson(Map<String, dynamic> json) => MoodTracker(
      (json['korisnikId'] as num?)?.toInt(),
      DateTime.parse(json['datumEvidencije'] as String),
      json['vrijednostRaspolozenja'] as String?,
      json['opisRaspolozenja'] as String?,
      json['ime'] as String?,
      json['prezime'] as String?,
    );

Map<String, dynamic> _$MoodTrackerToJson(MoodTracker instance) =>
    <String, dynamic>{
      'korisnikId': instance.korisnikId,
      'datumEvidencije': instance.datumEvidencije.toIso8601String(),
      'vrijednostRaspolozenja': instance.vrijednostRaspolozenja,
      'opisRaspolozenja': instance.opisRaspolozenja,
      'ime': instance.ime,
      'prezime': instance.prezime,
    };
