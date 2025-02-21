import 'package:json_annotation/json_annotation.dart';

part 'radni_prostor.g.dart';

@JsonSerializable()
class RadniProstor {
  int radniProstorId;
  String oznaka;
  int kapacitet;
  bool aktivna;

  factory RadniProstor.fromJson(Map<String, dynamic> json) =>
      _$RadniProstorFromJson(json);

  RadniProstor(this.radniProstorId, this.oznaka, this.kapacitet, this.aktivna);

  Map<String, dynamic> toJson() => _$RadniProstorToJson(this);
}
