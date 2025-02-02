import 'package:exam_mobile/models/korisnik.dart';
import 'package:exam_mobile/models/mood_tracker.dart';
import 'package:exam_mobile/providers/korisnik_provider.dart';
import 'package:exam_mobile/providers/mood_tracker_provider.dart';
import 'package:exam_mobile/utils/util.dart';
import 'package:flutter/material.dart';

class DodajMoodTrackerScreen extends StatefulWidget {
  const DodajMoodTrackerScreen({super.key});

  @override
  State<DodajMoodTrackerScreen> createState() => _DodajMoodTrackerScreenState();
}

class _DodajMoodTrackerScreenState extends State<DodajMoodTrackerScreen> {
  List<Korisnik> _users = [];
  Korisnik? _selectedUser;
  DateTime _selectedDate = DateTime.now();
  String _opisRaspolozenja = "";

  String _status = "Sretan";
  final MoodTrackerProvider _moodTrackerProvider = MoodTrackerProvider();
  final KorisnikProvider _korisnikProvider = KorisnikProvider();

  Future<void> fetchData() async {
    try {
      final response = await _korisnikProvider.get();

      setState(() {
        _users = response.result;
      });
    } catch (e) {
      print('Error fetching data: $e');
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void _addTodo() async {
    if (_selectedUser == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Greška'),
          content: const Text('Morate odabrati korisnika.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }
    if (_opisRaspolozenja == "") {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Greška'),
          content: const Text('Morate unijeti opis'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }
    try {
      await _moodTrackerProvider.insert(MoodTracker(_selectedUser!.korisnikId,
          _selectedDate, _status, _opisRaspolozenja, null, null));

      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Uspjesno'),
          content: const Text('Uspjesno dodano raspolozenje.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context, true);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Greška'),
          content: const Text(
              'Ne možete za isti datum i istu osobu dodati vise od dva raspolozenja'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Dodaj raspolozenja korisnika",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 23, 121, 251),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              DropdownButtonFormField<Korisnik>(
                value: _selectedUser,
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
              DropdownButtonFormField<String>(
                value: _status,
                onChanged: (String? value) {
                  setState(() {
                    _status = value ?? _status;
                  });
                },
                items: const [
                  DropdownMenuItem<String>(
                    value: "Sretan",
                    child: Text('Sretan/a'),
                  ),
                  DropdownMenuItem<String>(
                    value: "Tuzan",
                    child: Text('Tuzan/a'),
                  ),
                  DropdownMenuItem<String>(
                    value: "Uzbudjen",
                    child: Text('Uzbudjen/a'),
                  ),
                  DropdownMenuItem<String>(
                    value: "Umoran",
                    child: Text('Umoran/a'),
                  ),
                  DropdownMenuItem<String>(
                    value: "Pod_Stresom",
                    child: Text('Pod stresom'),
                  ),
                ],
                decoration: const InputDecoration(
                  labelText: 'Status',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Unesite opis raspolozenja',
                  border: OutlineInputBorder(),
                ),
                onChanged: (opis) {
                  setState(() {
                    _opisRaspolozenja = opis;
                  });
                },
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
                  if (selectedDate != null) {
                    setState(() {
                      _selectedDate = selectedDate;
                    });
                  }
                },
                child: Text('Odabrani datum: ${formatDate(_selectedDate)}'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _addTodo();
                },
                child: const Text('Dodaj'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
