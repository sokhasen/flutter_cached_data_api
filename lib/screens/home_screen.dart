import 'package:cached_data_api/models/models.dart';
import 'package:cached_data_api/services/country_service.dart';
import 'package:cached_data_api/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('World Wide Geo'),
      ),
      body: FutureBuilder<List<Country>>(
        future: CountryService.getCountries(),
        builder: (_, AsyncSnapshot<List<Country>> snapshot) {
          if (snapshot.hasError) {
            return MessageWidget(
              message: snapshot.error.toString(),
            );
          }
          if (!snapshot.hasData) {
            return LoadingWidget();
          }

          return snapshot.data.isEmpty
              ? Center(
                  child: Text('No any countries!'),
                )
              : ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    Country country = snapshot.data[index];
                    return CountryWidget(
                      name: country.name,
                      flag: country.flag,
                      population: country.population,
                      region: country.region,
                      capital: country.capital,
                    );
                  },
                );
        },
      ),
    );
  }
}
