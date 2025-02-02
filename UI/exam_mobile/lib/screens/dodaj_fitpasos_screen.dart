import 'package:exam_mobile/models/fitpasos.dart';
import 'package:exam_mobile/models/korisnik.dart';
import 'package:exam_mobile/providers/fitpasos_provider.dart';
import 'package:exam_mobile/providers/korisnik_provider.dart';
import 'package:exam_mobile/utils/util.dart';
import 'package:flutter/material.dart';

class DodajFitpasosScreen extends StatefulWidget {
  const DodajFitpasosScreen({super.key});

  @override
  State<DodajFitpasosScreen> createState() => _DodajFitpasosScreenState();
}

class _DodajFitpasosScreenState extends State<DodajFitpasosScreen> {
  List<Korisnik> _users = [];
  Korisnik? _selectedUser;
  DateTime _selectedDate = DateTime.now();
  bool _isActive = true;
  final KorisnikProvider _korisnikProvider = KorisnikProvider();
  final FitpasosProvider _fitpasosProvider = FitpasosProvider();

  Future<void> fetchData() async {
    try {
      final response = await _korisnikProvider.get();

      

      setState(() {
        _users = response.result;
      });
    } catch (e) {
      
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void _addPasos() async {
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
    try {
      await _fitpasosProvider.insert(Fitpasos(null, _selectedUser!.korisnikId,
          _isActive, _selectedDate, null, null));

      // ignore: use_build_context_synchronously
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Uspjesno'),
          content: const Text('Uspjesno dodat pasos.'),
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
          "Dodaj FIT Pasos",
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
              DropdownButtonFormField<bool>(
                value: _isActive,
                onChanged: (bool? value) {
                  setState(() {
                    _isActive = value ?? false;
                  });
                },
                items: const [
                  DropdownMenuItem<bool>(
                    value: true,
                    child: Text('Aktivan'),
                  ),
                  DropdownMenuItem<bool>(
                    value: false,
                    child: Text('Neaktivan'),
                  ),
                ],
                decoration: const InputDecoration(
                  labelText: 'Aktivan/Neaktivan',
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
                  _addPasos();
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
