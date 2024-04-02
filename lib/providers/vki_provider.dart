import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VKIProvider with ChangeNotifier {
  SharedPreferences? _prefs;

  VKIProvider() {
    SharedPreferences.getInstance().then((sharedPrefs) {
      _prefs = sharedPrefs;
    });
  }

  double? _previousVKI; // Önceki VKI değeri
  String? _previousVKIDurum; // Önceki VKI değerine ait durum

  // Önceki VKI değeri getter'ı
  double? get previousVKI => _previousVKI;

  // Önceki VKI değerine ait durum getter'ı
  String? get previousVKIDurum => _previousVKIDurum;

  Future<void> calculateVKI() async {
    // Kilo ve boy verilerini al
    double kilo = _kilo;
    double boy = _boy / 100; // cm cinsinden alındığı için metre cinsine çevir

    // Vücut Kütle İndeksi (VKI) hesaplama
    double vki = kilo / (boy * boy);

    // VKI'ye göre kişinin durumunu değerlendir
    String durum;
    if (vki < 18.5) {
      durum = 'Zayıf';
    } else if (vki >= 18.5 && vki < 24.9) {
      durum = 'Normal';
    } else if (vki >= 24.9 && vki < 29.9) {
      durum = 'Fazla Kilolu';
    } else {
      durum = 'Obez';
    }

    // Save previous VKI value and its status
    _previousVKI = await _prefs?.getDouble('savedVKI');
    _previousVKIDurum = await _prefs?.getString('savedVKIDurum');

    // Save current VKI value to SharedPreferences
    if (_prefs != null) {
      await _prefs!.setDouble('savedVKI', vki);
      await _prefs!.setString('savedVKIDurum', durum);
    }

    // Değişiklikleri bildir
    notifyListeners();
  }

  double _boy = 125; // Başlangıç boy değeri 125
  double _kilo = 35; // Başlangıç kilo değeri 35
  String _cinsiyet = '';
  int _yas = 0;

  double get boy => _boy;
  double get kilo => _kilo;
  String get cinsiyet => _cinsiyet;
  int get yas => _yas;

  setBoy(double value) {
    _boy = value;
    notifyListeners();
  }

  setKilo(double value) {
    _kilo = value;
    notifyListeners();
  }

  setCinsiyet(String value) {
    _cinsiyet = value;
    notifyListeners();
  }

  setYas(int value) {
    _yas = value;
    notifyListeners();
  }

  double hesaplaVKI() {
    if (_boy <= 0 || _kilo <= 0) {
      return 0;
    }
    return _kilo / ((_boy / 100) * (_boy / 100));
  }
}
