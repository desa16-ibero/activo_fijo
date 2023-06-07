import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:unique_identifier/unique_identifier.dart';

import '../model/user.dart';
import 'custom_colors.dart';

class Var {
  static var box = Hive.box('Activo_fijo_box');

  static const String urlServer = 'intrawebpru.ibero.mx';
  static const String urlServerLogin = 'serviciosenlineapru.ibero.mx';
  static const double maxWidth = 700;

  static User? user;

  static ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: CustomColors.dartMainColor,
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(35)),
    ),
  );

  static String getDayHour(DateTime? date) {
    String dayHour = DateFormat('dd-MM-yyyy hh:mm:ss').format(date!);
    return dayHour;
  }

  static String getDateByYear(DateTime date) {
    String dayHour = DateFormat('yyyy-MM-dd hh:mm:ss').format(date);
    return dayHour;
  }

  static String getDateString(bool custom, DateTime date) {
    String dayFormat = DateFormat('dd').format(date);
    int day = int.parse(dayFormat);
    var dayStr = '';
    if (day < 10) {
      dayStr = '0$day';
    } else {
      dayStr = day.toString();
    }
    String monthFormat = DateFormat('MM').format(date);
    var monthStr = '';
    int month = int.parse(monthFormat);
    if (month < 10) {
      monthStr = '0$month';
    } else {
      monthStr = month.toString();
    }
    String year = DateFormat('yyyy').format(date);
    var dateComplete = '';
    if (custom) {
      dateComplete += '$dayStr-';
      dateComplete += '$monthStr-';
      dateComplete += year;
    } else {
      dateComplete += dayStr;
      dateComplete += monthStr;
      dateComplete += year;
    }
    return dateComplete;
  }

  static String md5Hash(String? nameDevice) {
    try {
      var tempString =
          '$nameDevice${getDateString(true, DateTime.now())}ib3vqjye3tws';

      String finalString = md5.convert(utf8.encode(tempString)).toString();

      return finalString.toUpperCase();
    } catch (error) {
      debugPrint(error.toString());
      return '';
    }
  }

  static Future<String?> getIdentifier() async {
    String? identifier = 'General';
    try {
      if (Platform.isAndroid || Platform.isIOS) {
        identifier = await UniqueIdentifier.serial;
      }
    } on PlatformException {
      identifier = 'Failed to get Unique Identifier';
    }

    return identifier;
  }

  static encryptedString(String value) {
    final pass = value;
    final key = encrypt.Key.fromUtf8('D3BkxBSoTpubByK0');
    final iv = encrypt.IV.fromUtf8('13bkatwVHobQdnMY');

    final encryptTemp =
        encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

    final encrypted = encryptTemp.encrypt(pass, iv: iv);

    return encrypted.base64;
  }
}

enum CollectionsDB {
  user,
}
