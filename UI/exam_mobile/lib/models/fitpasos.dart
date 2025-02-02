import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'fitpasos.g.dart';

@JsonSerializable()
class Fitpasos {
  final int? fitPasosId;
  final int? korisnikId;
  bool aktivan;
  DateTime datumVazenja;
  String? ime;
  String? prezime;

  Fitpasos(this.fitPasosId, this.korisnikId, this.aktivan, this.datumVazenja,
      this.ime, this.prezime);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Fitpasos.fromJson(Map<String, dynamic> json) =>
      _$FitpasosFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$FitpasosToJson(this);
}
