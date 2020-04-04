import 'dart:convert';
import 'package:encrypt/encrypt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Read {
  static Future<String> aesRead(String key) async {
    final preferences = await SharedPreferences.getInstance();
    final k = Key.fromUtf8(")J@NcRfUjXn2r5u8x/A%D*G-KaPdSgVk");
    final iv = IV.fromLength(16);
    final encrypt = Encrypter(AES(k, mode: AESMode.cbc));
    return encrypt.decrypt64(preferences.getString(key), iv: iv);
  }

  static Future<String> salsa20Read(String key) async {
    final preferences = await SharedPreferences.getInstance();
    final k = Key.fromLength(32);
    final iv = IV.fromLength(8);
    final encrypt = Encrypter(Salsa20(k));
    return encrypt.decrypt64(preferences.getString(key), iv: iv);
  }

  static Future<String> ferNetRead(String key) async {
    final preferences = await SharedPreferences.getInstance();
    final k = Key.fromUtf8(")J@NcRfUjXn2r5u8x/A%D*G-KaPdSgVk");
    final b64key = Key.fromUtf8(base64Url.encode(k.bytes));
    final ferNet = Fernet(b64key);
    final encrypt = Encrypter(ferNet);
    return encrypt.decrypt64(preferences.getString(key));
  }
}
