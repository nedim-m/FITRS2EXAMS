import 'package:exam_mobile/models/korisnik.dart';
import 'package:exam_mobile/models/radni_prostor.dart';
import 'package:exam_mobile/models/rezervacija_prostora.dart';
import 'package:exam_mobile/models/rezervacija_prostora_stats.dart';
import 'package:exam_mobile/providers/korisnik_provider.dart';
import 'package:exam_mobile/providers/radni_prostor_provider.dart';
import 'package:exam_mobile/providers/rezervacija_prostora_provider.dart';

import 'package:exam_mobile/screens/dodaj_rezervaciju_prostora_screen.dart';
import 'package:exam_mobile/utils/util.dart';
import 'package:flutter/material.dart';

class RezervacijaProstoraScreen extends StatefulWidget {
  const RezervacijaProstoraScreen({super.key});

  @override
  State<RezervacijaProstoraScreen> createState() =>
      _RezervacijaProstoraScreenState();
}

class _RezervacijaProstoraScreenState extends State<RezervacijaProstoraScreen> {
  List<RezervacijaProstora> _filteredData = [];
  List<Korisnik> _users = [];
  List<RadniProstor> _radniProstor = [];
  List<RezervacijaProstoraStats> _rezervacijaProstoraStats = [];
  final RezervacijaProstoraProvider _rezervacijaProstoraProvider =
      RezervacijaProstoraProvider();
  final RadniProstorProvider _radniProstorProvider = RadniProstorProvider();
  final KorisnikProvider _korisnikProvider = KorisnikProvider();
  Korisnik? _selectedUser;
  RadniProstor? _selectedRadniProstor;
  int? _status;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await _rezervacijaProstoraProvider.get();
      final responseUser = await _korisnikProvider.get();
      final responseRadniProstor = await _radniProstorProvider.get();
      final responseRezervacijaStats =
          await _rezervacijaProstoraProvider.getRezevacijaStats();

      print(responseRezervacijaStats);

      setState(() {
        _filteredData = response.result;
        _users = responseUser.result;
        _rezervacijaProstoraStats = responseRezervacijaStats;
        _radniProstor = responseRadniProstor.result;
      });
    } catch (e) {
      print('Error fetching data: $e');
      throw Exception('Failed to load data');
    }
  }

  Future<void> filterData() async {
    try {
      final response = await _rezervacijaProstoraProvider.get(filter: {
        'KorisnikId': _selectedUser?.korisnikId,
        'RadniProstorId': _selectedRadniProstor?.radniProstorId,
        'PretragaStatusRezervacije': _status
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
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Rezervacija Prostora",
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
                                    const DodajRezervacijuProstoraScreen()),
                          );

                          if (result == true) {
                            setState(() {
                              fetchData();
                            });
                          }
                        },
                        child: const Text('Rezervisi'),
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
                        child: Text('Potvrdjena'),
                      ),
                      DropdownMenuItem<int>(
                        value: 1,
                        child: Text('Na cekanju'),
                      ),
                      DropdownMenuItem<int>(
                        value: 2,
                        child: Text('Otkazana'),
                      ),
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Status rezervacije',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
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
                  DataColumn(label: Text('Naziv prostora')),
                  DataColumn(label: Text('Kapacitet')),
                  DataColumn(label: Text('Datum i vrijeme')),
                  DataColumn(label: Text('Trajanje')),
                  DataColumn(label: Text('Status')),
                ],
                rows: _filteredData.map((item) {
                  return DataRow(cells: [
                    DataCell(Text(item.ime ?? '')),
                    DataCell(Text(item.prezime ?? '')),
                    DataCell(Text(item.oznaka ?? '')),
                    DataCell(Text(item.kapacitet.toString())),
                    DataCell(Text(formatDateWithTime(
                        item.datumIVrijemePocetkaRezervacije))),
                    DataCell(Text(item.trajanje.toString())),
                    DataCell(
                      Text((item.statusRezervacije ?? '').replaceAll('_', ' ')),
                    ),
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
                    "Statistika rezervacija:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ..._rezervacijaProstoraStats.map((stat) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          stat.statusRezervacije!.replaceAll('_', ' '),
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
