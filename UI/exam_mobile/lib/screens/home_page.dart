import 'package:exam_mobile/screens/fitpasos_screen.dart';
import 'package:exam_mobile/screens/login_page.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              text: 'FIT PASOS ',
              navigateTo: FitPasosScreen(),
            ),
            CustomButton(
              text: 'Logout',
              navigateTo: LoginPage(),
            ),
          ],
        ),
      ),
    );
  }
}
