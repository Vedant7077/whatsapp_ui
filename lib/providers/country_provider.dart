import 'dart:io';

import 'package:flutter/material.dart';

class CountryProvider extends ChangeNotifier{

  File? _pickedImage;

  String _country = "India";
  final List<String> _countryList = [
    "India",
    "Germany",
    "Indonesia",
    "Australia",
    "England",
  ];

  List<String> getCountryList() => _countryList;

  File? getImage(){
    return _pickedImage;
    }

  void updateImage(File? image){
    _pickedImage = image;
    notifyListeners();  
    }

  String getCountry() => _country;

  void changeCountry(String value){
    _country = value;
    notifyListeners();
  }
}