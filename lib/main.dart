import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/auth.dart';

void main() => runApp(HomePage());

 
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tima Fitness',
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        textTheme: TextTheme(titleMedium: TextStyle(color: Colors.black))
      ),
      home: AuthPages(),
    );
  }
}

