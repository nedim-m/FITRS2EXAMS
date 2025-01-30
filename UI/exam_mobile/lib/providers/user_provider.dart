import 'dart:convert';

import 'package:exam_mobile/models/user.dart';
import 'package:exam_mobile/providers/base_provider.dart';

class UserProvider extends BaseProvider<User> {
  UserProvider() : super("User");

  Future<User?> authenticate(String username, String password) async {
    var url = "$fullUrl/login?username=$username&password=$password";
    var uri = Uri.parse(url);

  

    var headers = {
      "Content-Type": "application/json",
    };
    var response = await http!.post(uri, headers: headers);


    if (isValidResponse(response)) {
      if (response.body.isNotEmpty) {
        var data = jsonDecode(response.body);
        return User.fromJson(data);
      }
    }
    return null;
  }
}
