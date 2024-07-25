import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(BatelecApp());
}

class BatelecApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Batelec Go!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(registeredUsers: [],),
    );
  }
}
