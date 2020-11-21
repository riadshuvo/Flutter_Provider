import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier{
  String _units;
  List<String> _waxLines;

  SettingsProvider(){
    _units = "Imperial";
    _waxLines = ["Swix", "Toko"];
    loadPreferences();
  }

  List<String> get waxLines => _waxLines;

  String get units => _units;

  void _setWaxLines(List<String> value) {
    _waxLines = value;
    notifyListeners();
  }

  void setUnits(String value) {
    _units = value;
    notifyListeners();
    savePreferences();
  }

  void addWaxLine(String waxLine){
    if(!_waxLines.contains(waxLine)){
      _waxLines.add(waxLine);
      notifyListeners();
      savePreferences();
    }
  }

  void removeWaxLine(String waxLine){
    if(_waxLines.contains(waxLine)){
      _waxLines.remove(waxLine);
      notifyListeners();
      savePreferences();
    }
  }

  savePreferences() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("units", _units);
    pref.setStringList("waxs", _waxLines);
  }

  loadPreferences() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String units = pref.getString("units");
    List<String> waxs = pref.getStringList("waxs");

    if(units != null) setUnits(units);
    if(waxs != null) _setWaxLines(waxs);
  }

}