import 'package:bmi_calculator_app/providers/vki_provider.dart';
import 'package:bmi_calculator_app/screens.dart/vki_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VKIProvider(),
      child: MaterialApp(
        title: 'VKI Hesaplama',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: VKIScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
