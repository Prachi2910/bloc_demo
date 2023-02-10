import 'package:demo_project/modules/home/data/models/population_data.dart';

class NationPopulationModel {
  List<PopulationData>? data;

  NationPopulationModel({this.data});

  factory NationPopulationModel.fromJson(Map<String, dynamic> json) {
    return NationPopulationModel(
      data: json['data'] != null ? (json['data'] as List).map((i) => PopulationData.fromJson(i)).toList() : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['`data`'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
