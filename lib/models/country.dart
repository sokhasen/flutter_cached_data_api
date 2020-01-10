class Country {
  final String name;
  final String abbr;
  final String capital;
  final String region;
  final String subregion;
  final String flag;
  final String numericCode;
  final String nativeName;
  final int population;

  Country(
      {this.name,
      this.abbr,
      this.capital,
      this.region,
      this.subregion,
      this.flag,
      this.numericCode,
      this.nativeName,
      this.population});

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json['name'],
        abbr: json['alpha2Code'],
        capital: json['capital'],
        region: json['region'],
        subregion: json['subregion'],
        flag: json['flag'],
        numericCode: json['numericCode'],
        nativeName: json['nativeName'],
        population: json['population'],
      );
  static List<Country> fromList(List<dynamic> jsons) =>
      jsons.map<Country>((json) => Country.fromJson(json)).toList();
}
