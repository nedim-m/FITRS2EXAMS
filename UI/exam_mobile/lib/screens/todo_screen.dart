import 'package:exam_mobile/models/korisnik.dart';
import 'package:exam_mobile/models/todo.dart';
import 'package:exam_mobile/providers/korisnik_provider.dart';
import 'package:exam_mobile/providers/todo_provider.dart';
import 'package:exam_mobile/screens/dodaj_todo_screen.dart';
import 'package:exam_mobile/utils/util.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});
  static const String routeName = "/todo";

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<ToDo4924> _filteredData = [];
  List<Korisnik> _users = [];
  final TodoProvider _todoPasosProvider = TodoProvider();
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
      final response = await _todoPasosProvider.get();
      final responseUser = await _korisnikProvider.get();

      setState(() {
        _filteredData = response.result;
        _users = responseUser.result;
      });
    } catch (e) {
      print('Error fetching data: $e');
      throw Exception('Failed to load data');
    }
  }

  Future<void> filterData() async {
    try {
      final response = await _todoPasosProvider.get(filter: {
        'KorisnikId': _selectedUser?.korisnikId,
        'PretragaDatum': _selectedDate,
        'PretragaStatusAktivnosti': _status
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
          "TO DO",
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
                                builder: (context) => const DodajTodoScreen()),
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
                        child: Text('U toku'),
                      ),
                      DropdownMenuItem<int>(
                        value: 1,
                        child: Text('Realizovana'),
                      ),
                      DropdownMenuItem<int>(
                        value: 2,
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
                  DataColumn(label: Text('Naziv')),
                  DataColumn(label: Text('Opis')),
                  DataColumn(label: Text('Rok')),
                  DataColumn(label: Text('Status')),
                ],
                rows: _filteredData.map((item) {
                  return DataRow(cells: [
                    DataCell(Text(item.ime ?? '')),
                    DataCell(Text(item.prezime ?? '')),
                    DataCell(Text(item.nazivAktivnosti ?? '')),
                    DataCell(Text(item.opisAktivnosti ?? '')),
                    DataCell(Text(formatDate(item.krajnjiRok!))),
                    DataCell(
                      Text((item.statusAktivnosti ?? '').replaceAll('_', ' ')),
                    ),
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
