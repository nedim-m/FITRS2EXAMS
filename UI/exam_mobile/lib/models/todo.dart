import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class ToDo4924 {
  int? korisnikId;
  String? ime;
  String? prezime;
  String? nazivAktivnosti;
  String? opisAktivnosti;
  DateTime? krajnjiRok;
  String? statusAktivnosti;

  factory ToDo4924.fromJson(Map<String, dynamic> json) =>
      _$ToDo4924FromJson(json);

  ToDo4924(
    this.korisnikId,
    this.ime,
    this.prezime,
    this.nazivAktivnosti,
    this.opisAktivnosti,
    this.krajnjiRok,
    this.statusAktivnosti,
  );

  Map<String, dynamic> toJson() => _$ToDo4924ToJson(this);
}
