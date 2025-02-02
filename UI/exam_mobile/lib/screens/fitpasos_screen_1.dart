import 'package:exam_mobile/models/fitpasos.dart';
import 'package:exam_mobile/providers/fitpasos_provider.dart';
import 'package:exam_mobile/screens/dodaj_fitpasos_screen.dart';
import 'package:exam_mobile/utils/util.dart';
import 'package:flutter/material.dart';

class FitPasosScreen extends StatefulWidget {
  const FitPasosScreen({super.key});

  @override
  State<FitPasosScreen> createState() => _FitPasosScreenState();
}

class _FitPasosScreenState extends State<FitPasosScreen> {
  List<Fitpasos> _filteredData = [];
  final FitpasosProvider _fitPasosProvider = FitpasosProvider();
  String _nameQuery = '';
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await _fitPasosProvider.get();

      setState(() {
        _filteredData = response.result;
      });
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }

  Future<void> filterData() async {
    try {
      final response = await _fitPasosProvider.get(filter: {
        'ImePrezime': _nameQuery,
        'Datum': _selectedDate,
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
          "FIT Pasos",
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
                                    const DodajFitpasosScreen()),
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
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Pretraga po imenu/prezimenu',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _nameQuery = value;
                      });
                    },
                  ),
                  const SizedBox(height: 8),
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
                          ? 'Odabrani datum: ${formatDate(_selectedDate!)}'
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
                  DataColumn(label: Text('Datum')),
                  DataColumn(label: Text('Aktivan')),
                ],
                rows: _filteredData.map((item) {
                  return DataRow(cells: [
                    DataCell(Text(item.ime ?? 'N/A')),
                    DataCell(Text(item.prezime ?? 'N/A')),
                    DataCell(Text(formatDate(item.datumVazenja))),
                    DataCell(Text(item.aktivan ? 'DA' : 'NE')),
                  ]);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
