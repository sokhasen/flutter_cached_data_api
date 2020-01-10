import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryWidget extends StatelessWidget {
  final String name;
  final String flag;
  final int population;
  final String capital;
  final String region;
  const CountryWidget(
      {Key key,
      this.name,
      this.flag,
      this.population,
      this.capital,
      this.region})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 80,
            height: 40,
            child: SvgPicture.network(
              flag,
              fit: BoxFit.cover,
              placeholderBuilder: (BuildContext context) => Container(
                color: Colors.grey.shade200,
                child: Center(
                  child: Text('No Flag', style: TextStyle(color: Colors.grey.shade300,)),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      capital,
                      style: TextStyle(color: Colors.grey.shade400),
                    ),
                    Text(
                      '$population p',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
