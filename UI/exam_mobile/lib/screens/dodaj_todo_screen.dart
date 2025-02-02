import 'package:exam_mobile/models/korisnik.dart';
import 'package:exam_mobile/models/todo.dart';
import 'package:exam_mobile/providers/korisnik_provider.dart';
import 'package:exam_mobile/providers/todo_provider.dart';
import 'package:exam_mobile/utils/util.dart';
import 'package:flutter/material.dart';

class DodajTodoScreen extends StatefulWidget {
  const DodajTodoScreen({super.key});

  @override
  State<DodajTodoScreen> createState() => _DodajTodoScreenState();
}

class _DodajTodoScreenState extends State<DodajTodoScreen> {
  List<Korisnik> _users = [];
  Korisnik? _selectedUser;
  DateTime _selectedDate = DateTime.now();
  String _nazivAktivnosti = "";
  String _opisAktivnosti = "";
  String _status = "U_Toku";
  final KorisnikProvider _korisnikProvider = KorisnikProvider();
  final TodoProvider _todoasosProvider = TodoProvider();

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
    if (_nazivAktivnosti == "" || _opisAktivnosti == "") {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Greška'),
          content: const Text('Morate unijeti naziv i opis'),
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
      await _todoasosProvider.insert(ToDo4924(_selectedUser!.korisnikId, null,
          null, _nazivAktivnosti, _opisAktivnosti, _selectedDate, _status));

      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Uspjesno'),
          content: const Text('Uspjesno dodana aktivnost.'),
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
          content: const Text('Greska prilikom dodavanja pokusajte ponovo'),
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
          "Dodaj aktivnost korisnika",
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
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Unesite naziv aktivnosti',
                  border: OutlineInputBorder(),
                ),
                onChanged: (naziv) {
                  setState(() {
                    _nazivAktivnosti = naziv;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Unesite opis aktivnosti',
                  border: OutlineInputBorder(),
                ),
                onChanged: (opis) {
                  setState(() {
                    _opisAktivnosti = opis;
                  });
                },
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
                    value: "U_Toku",
                    child: Text('U toku'),
                  ),
                  DropdownMenuItem<String>(
                    value: "Realizovana",
                    child: Text('Realizovana'),
                  ),
                  DropdownMenuItem<String>(
                    value: "Istekla",
                    child: Text('Istekla'),
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
