import 'dart:convert';

import 'package:exam_mobile/models/rezervacija_prostora.dart';
import 'package:exam_mobile/models/rezervacija_prostora_stats.dart';

import 'base_provider.dart';

class RezervacijaProstoraProvider extends BaseProvider<RezervacijaProstora> {
  RezervacijaProstoraProvider() : super("RezervacijaProstora20022025");

  @override
  RezervacijaProstora fromJson(data) {
    return RezervacijaProstora.fromJson(data);
  }

  Future<List<RezervacijaProstoraStats>> getRezevacijaStats() async {
    final url = Uri.parse(
        'http://10.0.2.2:8888/RezervacijaProstora20022025/BrojRezervacija');
    print("Fetching data from: $url");

    final response = await http!.get(url, headers: createHeaders());
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((e) => RezervacijaProstoraStats.fromJson(e)).toList();
    } else {
      throw Exception(
          "Failed to fetch mood stats. Status code: ${response.statusCode}");
    }
  }
}
