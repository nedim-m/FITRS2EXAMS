import 'package:exam_mobile/models/user.dart';
import 'package:intl/intl.dart';

class Authorization {
  static String? username;
  static String? password;
  static User? korisnik;
}

String formatDate(DateTime date) => DateFormat("dd/MM/yyyy").format(date);
