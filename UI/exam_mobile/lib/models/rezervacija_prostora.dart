import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'rezervacija_prostora.g.dart';

@JsonSerializable()
class RezervacijaProstora {
  String? ime;
  String? prezime;
  String? oznaka;
  int? kapacitet;
  DateTime datumIVrijemePocetkaRezervacije;
  int trajanje;
  String? statusRezervacije;
  int? korisnikId;
  int? radniProstorId;
  String? napomena;

  RezervacijaProstora(
      this.ime,
      this.prezime,
      this.oznaka,
      this.kapacitet,
      this.datumIVrijemePocetkaRezervacije,
      this.trajanje,
      this.statusRezervacije,
      this.korisnikId,
      this.radniProstorId,
      this.napomena);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory RezervacijaProstora.fromJson(Map<String, dynamic> json) =>
      _$RezervacijaProstoraFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$RezervacijaProstoraToJson(this);
}
