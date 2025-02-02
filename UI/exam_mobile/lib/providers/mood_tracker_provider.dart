import 'dart:convert';

import 'package:exam_mobile/models/mood_tracker.dart';
import 'package:exam_mobile/models/mood_tracker_stats.dart';


import 'base_provider.dart';

class MoodTrackerProvider extends BaseProvider<MoodTracker> {
  MoodTrackerProvider() : super("MoodTracker");

  @override
  MoodTracker fromJson(data) {
    return MoodTracker.fromJson(data);
  }

  Future<List<MoodTrackerStats>> getMoodStats() async {
    final url = Uri.parse('http://10.0.2.2:8888/MoodTracker/BrojPonavljanja');
    print("Fetching data from: $url");

    final response = await http!.get(url, headers: createHeaders());
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((e) => MoodTrackerStats.fromJson(e)).toList();
    } else {
      throw Exception(
          "Failed to fetch mood stats. Status code: ${response.statusCode}");
    }
  }
}
