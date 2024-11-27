import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _numitemcart = prefs.getDouble('ff_numitemcart') ?? _numitemcart;
    });
    _safeInit(() {
      _soma = prefs.getDouble('ff_soma') ?? _soma;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  double _numitemcart = 0.0;
  double get numitemcart => _numitemcart;
  set numitemcart(double value) {
    _numitemcart = value;
    prefs.setDouble('ff_numitemcart', value);
  }

  double _soma = 0.0;
  double get soma => _soma;
  set soma(double value) {
    _soma = value;
    prefs.setDouble('ff_soma', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
