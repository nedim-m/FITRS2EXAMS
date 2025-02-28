import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'rezervacija_prostora_stats.g.dart';

@JsonSerializable()
class RezervacijaProstoraStats {
  String? statusRezervacije;
  int brojPojavljivanja;

  RezervacijaProstoraStats(
    this.statusRezervacije,
    this.brojPojavljivanja,
  );

  
  factory RezervacijaProstoraStats.fromJson(Map<String, dynamic> json) =>
      _$RezervacijaProstoraStatsFromJson(json);


  Map<String, dynamic> toJson() => _$RezervacijaProstoraStatsToJson(this);
}
