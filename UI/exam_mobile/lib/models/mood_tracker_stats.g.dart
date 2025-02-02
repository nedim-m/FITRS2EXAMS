// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_tracker_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoodTrackerStats _$MoodTrackerStatsFromJson(Map<String, dynamic> json) =>
    MoodTrackerStats(
      json['vrijednostRaspolozenja'] as String?,
      (json['brojPojavljivanja'] as num).toInt(),
    );

Map<String, dynamic> _$MoodTrackerStatsToJson(MoodTrackerStats instance) =>
    <String, dynamic>{
      'vrijednostRaspolozenja': instance.vrijednostRaspolozenja,
      'brojPojavljivanja': instance.brojPojavljivanja,
    };
