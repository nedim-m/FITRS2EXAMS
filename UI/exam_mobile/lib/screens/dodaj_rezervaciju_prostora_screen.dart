import 'package:exam_mobile/models/korisnik.dart';
import 'package:exam_mobile/models/radni_prostor.dart';
import 'package:exam_mobile/models/rezervacija_prostora.dart';
import 'package:exam_mobile/providers/korisnik_provider.dart';
import 'package:exam_mobile/providers/radni_prostor_provider.dart';
import 'package:exam_mobile/providers/rezervacija_prostora_provider.dart';
import 'package:exam_mobile/utils/util.dart';
import 'package:flutter/material.dart';

class DodajRezervacijuProstoraScreen extends StatefulWidget {
  const DodajRezervacijuProstoraScreen({super.key});

  @override
  State<DodajRezervacijuProstoraScreen> createState() =>
      _DodajRezervacijuProstoraScreenState();
}

class _DodajRezervacijuProstoraScreenState
    extends State<DodajRezervacijuProstoraScreen> {
  List<Korisnik> _users = [];
  List<RadniProstor> _radniProstor = [];
  Korisnik? _selectedUser;
  DateTime _selectedDate = DateTime.now();
  String _napomena = "";
  int _trajanje = 1;

  RadniProstor? _selectedRadniProstor;

  final RezervacijaProstoraProvider _rezervacijaProstoraProvider =
      RezervacijaProstoraProvider();
  final KorisnikProvider _korisnikProvider = KorisnikProvider();
  final RadniProstorProvider _radniProstorProvider = RadniProstorProvider();

  Future<void> fetchData() async {
    try {
      final response = await _korisnikProvider.get();
      final responseRadniProstor = await _radniProstorProvider.get();

      setState(() {
        _users = response.result;
        _radniProstor = responseRadniProstor.result;
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

  void _addRezervacija() async {
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

    if (_selectedRadniProstor == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Greška'),
          content: const Text('Morate odabrati prostor.'),
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

    if (_trajanje > 6) {
      bool? continueReservation = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Upozorenje'),
          content: const Text(
              'Morate čekati odobrenje od Admina za svako trajanje duže od 6h!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Nastavi'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Prekini'),
            ),
          ],
        ),
      );

      if (continueReservation == false) {
        return; //
      }
    }

    try {
      await _rezervacijaProstoraProvider.insert(RezervacijaProstora(
        null,
        null,
        null,
        null,
        _selectedDate,
        _trajanje,
        null,
        _selectedUser?.korisnikId,
        _selectedRadniProstor?.radniProstorId,
        _napomena,
      ));

      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Uspješno'),
          content: const Text('Uspješno dodana rezervacija.'),
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
              'Greška prilikom rezervacije, molimo pokušajte ponovo!'),
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
          "Dodaj rezervaciju",
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
              DropdownButtonFormField<RadniProstor>(
                value: _radniProstor.contains(_selectedRadniProstor)
                    ? _selectedRadniProstor
                    : null,
                onChanged: (RadniProstor? radniProstor) {
                  setState(() {
                    _selectedRadniProstor = radniProstor;
                  });
                },
                items: _radniProstor.map((RadniProstor radniProstor) {
                  return DropdownMenuItem(
                    value: radniProstor,
                    child: Text(radniProstor.oznaka),
                  );
                }).toList(),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Odaberi radni prostor"),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Trajanje: '),
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: _trajanje > 1
                        ? () => setState(() => _trajanje = _trajanje - 1)
                        : null,
                  ),
                  Text(
                    "$_trajanje h",
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => setState(() => _trajanje = _trajanje + 1),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Unesite opcionalno napomenu',
                  border: OutlineInputBorder(),
                ),
                onChanged: (napomena) {
                  setState(() {
                    _napomena = napomena;
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
                    final selectedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                    );

                    if (selectedTime != null) {
                      setState(() {
                        _selectedDate = DateTime(
                          selectedDate.year,
                          selectedDate.month,
                          selectedDate.day,
                          selectedTime.hour,
                          selectedTime.minute,
                        );
                      });
                    }
                  }
                },
                child: Text(
                  'Odabrani datum i vrijeme: ${formatDateWithTime(_selectedDate)}',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _addRezervacija();
                },
                child: const Text('Rezervisi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
