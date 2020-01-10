import 'dart:convert';
import 'dart:io';

import 'package:cached_data_api/models/country.dart';
import 'package:cached_data_api/utils/perference.dart';
import 'package:http/http.dart' as http;

class CountryService {
  static const String URL = 'https://restcountries.eu/rest/v2/all';
  static Future<List<Country>> getCountries() async {
    try {
      String cachedCountries = await Preference.getItem('countries');
      if (cachedCountries == '') {
        print('------------------------Fetch api');
        var response = await http.get(URL);

        if (response.statusCode == HttpStatus.ok) {
          List data = json.decode(response.body);
          Preference.setItem('countries', response.body);
          return Country.fromList(data);
        }
        return [];
      }
      else {
        return Country.fromList(json.decode(cachedCountries));
      }
    } catch (e) {
      print(e);
      throw Exception('Could Not Load Countries!');
    }
  }
}
