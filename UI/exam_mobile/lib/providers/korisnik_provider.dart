import 'dart:convert';

import 'package:exam_mobile/models/korisnik.dart';
import 'package:exam_mobile/providers/base_provider.dart';

class KorisnikProvider extends BaseProvider<Korisnik> {
  KorisnikProvider() : super("Korisnik");

  @override
  Korisnik fromJson(data) {
    return Korisnik.fromJson(data); 
  }

  Future<Korisnik?> authenticate(String username, String password) async {
    var url = "$fullUrl/login?username=$username&password=$password";
    var uri = Uri.parse(url);

    var headers = {
      "Content-Type": "application/json",
    };
    var response = await http!.post(uri, headers: headers);

    if (isValidResponse(response)) {
      if (response.body.isNotEmpty) {
        var data = jsonDecode(response.body);
        return Korisnik.fromJson(data);
      }
    }
    return null;
  }
}
