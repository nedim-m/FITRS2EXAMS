// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radni_prostor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RadniProstor _$RadniProstorFromJson(Map<String, dynamic> json) => RadniProstor(
      (json['radniProstorId'] as num).toInt(),
      json['oznaka'] as String,
      (json['kapacitet'] as num).toInt(),
      json['aktivna'] as bool,
    );

Map<String, dynamic> _$RadniProstorToJson(RadniProstor instance) =>
    <String, dynamic>{
      'radniProstorId': instance.radniProstorId,
      'oznaka': instance.oznaka,
      'kapacitet': instance.kapacitet,
      'aktivna': instance.aktivna,
    };
