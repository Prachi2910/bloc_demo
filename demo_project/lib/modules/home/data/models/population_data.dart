class PopulationData {
  String? idNation;
  String? nation;
  int? idYear;
  String? slugNation;
  int? population;
  String? year;

  PopulationData({this.idNation, this.nation, this.idYear, this.slugNation, this.population, this.year});

  factory PopulationData.fromJson(Map<String, dynamic> json) {
    return PopulationData(
      idNation: json['ID Nation'],
      nation: json['Nation'],
      idYear: json['ID Year'],
      slugNation: json['Slug Nation'],
      population: json['Population'],
      year: json['Year'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID Nation'] = idNation;
    data['Nation'] = nation;
    data['ID Year'] = idYear;
    data['Slug Nation'] = slugNation;
    data['Population'] = population;
    data['Year'] = year;
    return data;
  }
}
