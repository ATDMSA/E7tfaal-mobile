import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:celebration/Pages/SelectCity.dart';
class SelectCountryProvider extends ChangeNotifier {
  TextEditingController countryController = TextEditingController();
  var _selectedCountriesData;
  get selectedCountriesData => _selectedCountriesData;

  String _selectedCountryName;
  get selectedCountryName => _selectedCountryName;

  int _selectedCountryCode;
  get selectedCountryCode => _selectedCountryCode;

  set setCountryName(String name) {
    _selectedCountryName = name;
    countryController = TextEditingController(text: selectedCountryName);
    notifyListeners();
  }

  set setCountryCode(int code) {
    _selectedCountryCode = code;
    notifyListeners();
  }

  selectCountryFun(BuildContext context) async {
    _selectedCountriesData = await Navigator.push(context, MaterialPageRoute(builder: (context) => SelectAreas(), fullscreenDialog: true));

    if (selectedCountriesData != null) {
      setCountryName = selectedCountriesData[1];
      setCountryCode = selectedCountriesData[0];

     // Provider.of<UserDataProvider>(context, listen: false).saveCountryCodeApi(selectedCountryCode);
     // Provider.of<UserDataProvider>(context, listen: false).saveCountryNameUi(selectedCountryName);
      notifyListeners();
    }

  }
}