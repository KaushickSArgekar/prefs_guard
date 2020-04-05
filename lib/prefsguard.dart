library prefs_guard;

import 'package:flutter/material.dart';
import 'package:prefs_guard/read.dart';
import 'package:prefs_guard/write.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum GuardType { AES, Salsa20, FerNet }

class PrefsGuard {
  final GuardType guardType;

  PrefsGuard(this.guardType);

  void write({@required String key, @required String value}) {
    switch (guardType) {
      case GuardType.AES:
        Write.aesWrite(key, value);
        break;
      case GuardType.Salsa20:
        Write.salsa20Write(key, value);
        break;
      case GuardType.FerNet:
        Write.ferNateWrite(key, value);
        break;
    }
  }

  Future<String> read({@required String key}) async {
    switch (guardType) {
      case GuardType.AES:
        return Read.aesRead(key);
        break;
      case GuardType.Salsa20:
        return Read.salsa20Read(key);
        break;
      case GuardType.FerNet:
        return Read.ferNetRead(key);
        break;
    }
  }

  void clearPres() async{
    final prefs=await SharedPreferences.getInstance();
    prefs.clear();

  }
}
