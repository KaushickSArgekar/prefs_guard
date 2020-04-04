import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Write{


  static void aesWrite(String key, String value) async{
    final preferences=await SharedPreferences.getInstance();
    final k = Key.fromUtf8(")J@NcRfUjXn2r5u8x/A%D*G-KaPdSgVk");
    final iv = IV.fromLength(16);
    final encrypt = Encrypter(AES(k,mode: AESMode.cbc));
    final encryptedValue=encrypt.encrypt(value,iv: iv);
    preferences.setString(key,encryptedValue.base64);
  }

  static void salsa20Write(String key, String value) async{
    final preferences=await SharedPreferences.getInstance();
    final k = Key.fromLength(32);
    final iv = IV.fromLength(8);
    final encrypt = Encrypter(Salsa20(k));
    final encryptedValue = encrypt.encrypt(value, iv: iv);
    preferences.setString(key, encryptedValue.base64);
  }

  static void ferNateWrite(String key, String value) async{
    final preferences=await SharedPreferences.getInstance();
    final k = Key.fromUtf8(')J@NcRfUjXn2r5u8x/A%D*G-KaPdSgVk');
    final b64key = Key.fromUtf8(base64Url.encode(k.bytes));
    final ferNet = Fernet(b64key);
    final encrypt = Encrypter(ferNet);
    final encryptedValue = encrypt.encrypt(value);
    preferences.setString(key, encryptedValue.base64);


  }


}