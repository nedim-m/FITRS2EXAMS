// ignore: file_names
import 'package:exam_mobile/models/fitpasos.dart';
import 'package:exam_mobile/providers/fitpasos_provider.dart';
import 'package:exam_mobile/screens/dodaj_fitpasos_screen.dart';
import 'package:exam_mobile/utils/util.dart';
import 'package:flutter/material.dart';

class FitPasosScreenII extends StatefulWidget {
  const FitPasosScreenII({super.key});

  @override
  State<FitPasosScreenII> createState() => _FitPasosScreenIIState();
}

class _FitPasosScreenIIState extends State<FitPasosScreenII> {
  List<Fitpasos> _filteredData = [];
  final FitpasosProvider _fitPasosProvider = FitpasosProvider();
  String _nameQuery = '';
  DateTime? _selectedDateod;
  DateTime? _selectedDatedo;

  Future<void> fetchData() async {
    try {
      final response = await _fitPasosProvider.get();

      setState(() {
        _filteredData = response.result;
      });
    } catch (e) {
      print('Error fetching data: $e');
      throw Exception('Failed to load data');
    }
  }

  Future<void> filterData() async {
    try {
      final response = await _fitPasosProvider.get(filter: {
        'FirstNameLastName': _nameQuery,
        'DatumOd': _selectedDateod,
        'DatumDo': _selectedDatedo
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
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "FIT Pasos II",
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
                      final selectedDateod = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      setState(() {
                        _selectedDateod = selectedDateod;
                      });
                    },
                    child: Text(
                      _selectedDateod != null
                          ? 'Odabrani datum od: ${formatDate(_selectedDateod!)}'
                          : 'Odaberi datum od',
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () async {
                      final selectedDatedo = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      setState(() {
                        _selectedDatedo = selectedDatedo;
                      });
                    },
                    child: Text(
                      _selectedDatedo != null
                          ? 'Odabrani datum od: ${formatDate(_selectedDatedo!)}'
                          : 'Odaberi datum do',
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
                  DataColumn(
                    label: Text('Ime i prezime'),
                  ),
                  DataColumn(
                    label: Text('Datum izdavanja'),
                  ),
                  DataColumn(
                    label: Text('Validan'),
                  ),
                ],
                rows: _filteredData.map(
                  (data) {
                    return DataRow(cells: [
                      DataCell(Text('${data.ime} ${data.prezime}')),
                      DataCell(Text(formatDate(data.datumVazenja))),
                      DataCell(Text(data.aktivan ? 'DA' : 'NE')),
                    ]);
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
