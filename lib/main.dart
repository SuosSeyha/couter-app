import 'package:flutter/material.dart';
import 'package:local_storage_11_12/SharePreference/counter_app.dart';
import 'package:local_storage_11_12/SharePreference/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage()
    );
  }
}
