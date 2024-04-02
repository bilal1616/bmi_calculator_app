import 'package:bmi_calculator_app/widgets/vki_form.dart';
import 'package:flutter/material.dart';

class VKIScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.indigo,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.150,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Vücut Kütle İndeks Hesaplama',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: VKIForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
