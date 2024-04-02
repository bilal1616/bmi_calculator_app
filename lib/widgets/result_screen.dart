import 'package:bmi_calculator_app/providers/vki_provider.dart';
import 'package:bmi_calculator_app/screens.dart/vki_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double vki = Provider.of<VKIProvider>(context).hesaplaVKI();
    String durum = '';

    // Get previous VKI value and its status
    double? previousVKI = Provider.of<VKIProvider>(context).previousVKI ?? 0;
    String? previousVKIDurum =
        Provider.of<VKIProvider>(context).previousVKIDurum ?? '';

    if (vki > 0) {
      if (vki < 18.5) {
        durum = 'Zayıf';
      } else if (vki < 24.9) {
        durum = 'Normal';
      } else if (vki < 29.9) {
        durum = 'Fazla Kilolu';
      } else {
        durum = 'Obez';
      }
    }

    return Scaffold(
      body: Container(
        color: Colors.indigo,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    'Vücut Kütle İndeks Sonuçları',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Vücut Kütle İndeksi: ${vki.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Kayıtlı VKI: ${previousVKI.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 160, 52, 13)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Durum: $durum',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Kayıtlı Durum: $previousVKIDurum',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 160, 52, 13)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => VKIScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: Text('Anasayfa',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
