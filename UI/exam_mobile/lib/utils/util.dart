import 'package:exam_mobile/models/korisnik.dart';
import 'package:intl/intl.dart';

class Authorization {
  static String? username;
  static String? password;
  static Korisnik? korisnik;
}

String formatDate(DateTime date) => DateFormat("dd/MM/yyyy").format(date);
String formatDateWithTime(DateTime date) => DateFormat("dd/MM/yyyy HH:mm").format(date);

