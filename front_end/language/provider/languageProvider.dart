import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Language with ChangeNotifier {
  String appLanguage='普通话';//存选择的方言
  void getLanguage(String language)async
  {
    appLanguage=language;
    print(appLanguage);
    notifyListeners();
    final data = await SharedPreferences.getInstance();//存入磁盘
    data.setString('language', appLanguage);
  }
}
