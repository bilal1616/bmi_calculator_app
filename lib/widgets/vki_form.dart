import 'package:bmi_calculator_app/providers/vki_provider.dart';
import 'package:bmi_calculator_app/widgets/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VKIForm extends StatefulWidget {
  @override
  _VKIFormState createState() => _VKIFormState();
}

class _VKIFormState extends State<VKIForm> {
  TextEditingController kiloController = TextEditingController();
  TextEditingController yasController = TextEditingController();

  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((sharedPrefs) {
      setState(() {
        prefs = sharedPrefs;
      });
    });
  }

  @override
  void dispose() {
    kiloController.dispose();
    yasController.dispose();
    super.dispose();
  }

  bool _validateInputs() {
    final kilo = kiloController.text;
    final yas = yasController.text;
    if (kilo.isEmpty || yas.isEmpty) {
      return false;
    }
    return true;
  }

  void _resetFields() {
    kiloController.clear();
    yasController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Provider.of<VKIProvider>(context, listen: false)
                      .setCinsiyet('Male');
                },
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Provider.of<VKIProvider>(context).cinsiyet == 'Male'
                        ? Colors.blue
                        : Colors.white,
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Icon(Icons.male, size: 30),
                      Text(
                        'Erkek',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<VKIProvider>(context, listen: false)
                      .setCinsiyet('Female');
                },
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:
                        Provider.of<VKIProvider>(context).cinsiyet == 'Female'
                            ? Colors.blue
                            : Colors.white,
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Icon(Icons.female, size: 30),
                      Text(
                        'Kadın',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  'Boy (cm): ${Provider.of<VKIProvider>(context).boy.toStringAsFixed(0)}',
                  style: TextStyle(fontSize: 18),
                ),
                Slider(
                  value: Provider.of<VKIProvider>(context).boy,
                  min: 125,
                  max: 250,
                  divisions: 250 - 125,
                  onChanged: (value) {
                    Provider.of<VKIProvider>(context, listen: false)
                        .setBoy(value);
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.remove, size: 30),
                  onPressed: () {
                    num currentWeight = int.tryParse(kiloController.text) ??
                        Provider.of<VKIProvider>(context, listen: false).kilo;
                    setState(() {
                      kiloController.text = (currentWeight - 1).toString();
                    });
                  },
                ),
                SizedBox(
                  width: 100,
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 18),
                    controller: kiloController,
                    onChanged: (value) {
                      Provider.of<VKIProvider>(context, listen: false)
                          .setKilo(double.tryParse(value) ?? 0);
                    },
                    decoration: InputDecoration(
                      hintText: 'Kilo',
                      hintStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add, size: 30),
                  onPressed: () {
                    num currentWeight = int.tryParse(kiloController.text) ??
                        Provider.of<VKIProvider>(context, listen: false).kilo;
                    setState(() {
                      kiloController.text = (currentWeight + 1).toString();
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.remove, size: 30),
                  onPressed: () {
                    int currentAge = int.tryParse(yasController.text) ??
                        Provider.of<VKIProvider>(context, listen: false).yas;
                    setState(() {
                      yasController.text = (currentAge - 1).toString();
                    });
                  },
                ),
                SizedBox(
                  width: 100,
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 18),
                    controller: yasController,
                    onChanged: (value) {
                      Provider.of<VKIProvider>(context, listen: false)
                          .setYas(int.tryParse(value) ?? 0);
                    },
                    decoration: InputDecoration(
                      hintText: 'Yaş',
                      hintStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add, size: 30),
                  onPressed: () {
                    int currentAge = int.tryParse(yasController.text) ??
                        Provider.of<VKIProvider>(context, listen: false).yas;
                    setState(() {
                      yasController.text = (currentAge + 1).toString();
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          ElevatedButton(
            onPressed: () {
              if (_validateInputs()) {
                Provider.of<VKIProvider>(context, listen: false).calculateVKI();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultScreen()),
                );
                _resetFields();
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Hata"),
                      content: Text("Lütfen tüm alanları doldurun."),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Tamam"),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: Text('VKI HESAPLA',
                style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
