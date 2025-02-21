import 'package:exam_mobile/screens/fitpasos_screen_1.dart';
import 'package:exam_mobile/screens/fitpasos_screen_2.dart';
import 'package:exam_mobile/screens/login_page.dart';
import 'package:exam_mobile/screens/mood_tracker_screen.dart';
import 'package:exam_mobile/screens/rezervacija_prostora_screen.dart';
import 'package:exam_mobile/screens/todo_screen.dart';
import 'package:exam_mobile/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                text: 'Fit Pasos PRVI ',
                navigateTo: FitPasosScreen(),
              ),
              CustomButton(
                text: 'Fit Pasos DRUGI ',
                navigateTo: FitPasosScreenII(),
              ),
              CustomButton(
                text: 'ToDo4924',
                navigateTo: TodoScreen(),
              ),
              CustomButton(
                text: 'MoodTracker',
                navigateTo: MoodTrackerScreen(),
              ),
              CustomButton(
                text: 'RezervacijaProstora20022025',
                navigateTo: RezervacijaProstoraScreen(),
              ),
              CustomButton(
                text: 'Logout',
                navigateTo: LoginPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
