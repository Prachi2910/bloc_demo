import 'package:demo_project/modules/home/data/models/nation_population_model.dart';
import 'package:demo_project/utils/api_constants.dart';
import 'package:dio/dio.dart';

abstract class HomeDataSource {
  Future<NationPopulationModel> doGetPopulation();
}

class HomeDataSourceImpl implements HomeDataSource {
  @override
  Future<NationPopulationModel> doGetPopulation() async {
    try {
      var response = await Dio().get(ApiConstants.nationUrl);
      return NationPopulationModel.fromJson(response.data);
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
