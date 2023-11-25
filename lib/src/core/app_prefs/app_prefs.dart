import 'dart:convert';

import 'package:alnawadi/src/core/resources/language_manager.dart';
import 'package:alnawadi/src/features/profile/data/models/address.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefsOnBoarding = 'onBoarding';
const String token = 'token';
const String skipLogin = 'skip';
const String language = 'language';
const String currentLocation = 'currentLocation';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  /// onBoarding
  Future<void> setOnBoarding() async {
    await _sharedPreferences.setBool(prefsOnBoarding, true);
  }

  bool isOnBoardingInPrefs() {
    return _sharedPreferences.getBool(prefsOnBoarding) ?? false;
  }

  Future<bool> removeOnBoarding() async {
    return await _sharedPreferences.remove(prefsOnBoarding);
  }

  /// user
  Future<void> setUserToken(String userToken) async {
    await _sharedPreferences.setString(token, userToken);
  }

  String getUserToken() {
    return _sharedPreferences.getString(token) ?? '';
  }

  bool isUserLoggedIn() {
    return _sharedPreferences.containsKey(token);
  }

/*  void logOut() {
    removeUserToken();

  }*/

  bool isSkipLogin() {
    final isSkip = getUserToken();

    if (isSkip == skipLogin) {
      return true;
    }

    return false;
  }

  Future<bool> removeUserToken() async {
    return await _sharedPreferences.remove(token);
  }

  // current location
  Future<void> setLocation(AddressModel address) async {
    await _sharedPreferences.setString(
        currentLocation, jsonEncode(address.toJson()));
  }

  AddressModel getLocation() {
    String? userPref = _sharedPreferences.getString(currentLocation);

    if (userPref == null) {
      return AddressModel.fromJson(noneLocation);
    }

    Map<String, dynamic> userMap = jsonDecode(userPref) as Map<String, dynamic>;
    return AddressModel.fromJson(userMap);
  }

  Future<bool> removeLocation() async {
    return await _sharedPreferences.remove(currentLocation);
  }

  /// language

  String getAppLang() {
    String? lang = _sharedPreferences.getString(language);

    if (lang != null && lang.isNotEmpty) {
      return lang;
    } else {
      return LanguageType.arabic.getValue();
    }
  }

  Future<void> changeAppLang() async {
    String currentLang = getAppLang();

    if (currentLang == LanguageType.arabic.getValue()) {
      await _sharedPreferences.setString(
          language, LanguageType.english.getValue());
    } else {
      await _sharedPreferences.setString(
          language, LanguageType.arabic.getValue());
    }
  }

  Future<Locale> getLocal() async {
    String currentLang = getAppLang();
    if (currentLang == LanguageType.arabic.getValue()) {
      return arabicLocal;
    } else {
      return englishLocal;
    }
  }
}

Map<String, dynamic> noneLocation = {
  'id': 0,
  'country': '',
  'state': '',
  'user_id': 0,
  'city': '',
  'address_1': '',
  'name': '',
  'email': '',
  'phone': '',
};
