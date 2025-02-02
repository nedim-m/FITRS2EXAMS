

import 'package:exam_mobile/models/korisnik.dart';
import 'package:exam_mobile/models/mood_tracker.dart';
import 'package:exam_mobile/models/mood_tracker_stats.dart';
import 'package:exam_mobile/providers/korisnik_provider.dart';
import 'package:exam_mobile/providers/mood_tracker_provider.dart';
import 'package:exam_mobile/screens/dodaj_mood_tracker_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoodTrackerScreen extends StatefulWidget {
  const MoodTrackerScreen({super.key});
  static const String routeName = "/moodtracker";

  @override
  State<MoodTrackerScreen> createState() => _MoodTrackerScreenState();
}

class _MoodTrackerScreenState extends State<MoodTrackerScreen> {
  List<MoodTracker> _filteredData = [];
  List<Korisnik> _users = [];
  List<MoodTrackerStats> _moodTrackerStats = [];
  final MoodTrackerProvider _moodTrackerProvider = MoodTrackerProvider();
  final KorisnikProvider _korisnikProvider = KorisnikProvider();
  Korisnik? _selectedUser;
  int? _status;

  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await _moodTrackerProvider.get();
      final responseUser = await _korisnikProvider.get();
      final responseMoodTracker = await _moodTrackerProvider.getMoodStats();

      print(responseMoodTracker);

      setState(() {
        _filteredData = response.result;
        _users = responseUser.result;
        _moodTrackerStats = responseMoodTracker;
      });
    } catch (e) {
      print('Error fetching data: $e');
      throw Exception('Failed to load data');
    }
  }

  Future<void> filterData() async {
    try {
      final response = await _moodTrackerProvider.get(filter: {
        'KorisnikId': _selectedUser?.korisnikId,
        'PretragaDatum': _selectedDate,
        'PretragaVrijednostRaspolozenja': _status
      });

      setState(() {
        _filteredData = response.result;
      });
    } catch (e) {
      print('Error fetching data: $e');
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd.MM.yyyy');
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Mood tracker",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 23, 121, 251),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const DodajMoodTrackerScreen()),
                          );

                          if (result == true) {
                            setState(() {
                              fetchData();
                            });
                          }
                        },
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<Korisnik>(
                    value:
                        _users.contains(_selectedUser) ? _selectedUser : null,
                    onChanged: (Korisnik? user) {
                      setState(() {
                        _selectedUser = user;
                      });
                    },
                    items: _users.map((Korisnik user) {
                      return DropdownMenuItem(
                        value: user,
                        child: Text("${user.ime} ${user.prezime}"),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Odaberi korisnika"),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<int>(
                    value: _status,
                    onChanged: (int? value) {
                      setState(() {
                        _status = value ?? _status;
                      });
                    },
                    items: const [
                      DropdownMenuItem<int>(
                        value: 0,
                        child: Text('Sretan/a'),
                      ),
                      DropdownMenuItem<int>(
                        value: 1,
                        child: Text('Tuzan/a'),
                      ),
                      DropdownMenuItem<int>(
                        value: 2,
                        child: Text('Uzbudjen/a'),
                      ),
                      DropdownMenuItem<int>(
                        value: 3,
                        child: Text('Umoran/a'),
                      ),
                      DropdownMenuItem<int>(
                        value: 4,
                        child: Text('Pod stresom'),
                      ),
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Status',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      setState(() {
                        _selectedDate = selectedDate;
                      });
                    },
                    child: Text(
                      _selectedDate != null
                          ? 'Odabrani datum: ${formatter.format(_selectedDate!)}'
                          : 'Odaberi datum',
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      filterData();
                    },
                    child: const Text('Pretraži'),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Ime')),
                  DataColumn(label: Text('Prezime')),
                  DataColumn(label: Text('Raspolozenje')),
                  DataColumn(label: Text('Opis')),
                  DataColumn(label: Text('Datum')),
                ],
                rows: _filteredData.map((item) {
                  return DataRow(cells: [
                    DataCell(Text(item.ime ?? '')),
                    DataCell(Text(item.prezime ?? '')),
                    DataCell(
                      Text((item.vrijednostRaspolozenja ?? '')
                          .replaceAll('_', ' ')),
                    ),
                    DataCell(Text(item.opisRaspolozenja ?? '')),
                    DataCell(Text(formatter.format(item.datumEvidencije))),
                  ]);
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Statistika raspoloženja:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ..._moodTrackerStats.map((stat) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          stat.vrijednostRaspolozenja!.replaceAll('_', ' '),
                        ),
                        Text(
                          stat.brojPojavljivanja.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
