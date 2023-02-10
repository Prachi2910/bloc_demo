import 'package:dartz/dartz.dart';
import 'package:demo_project/modules/home/data/models/nation_population_model.dart';
import 'package:demo_project/usecases/usecase.dart';

abstract class HomeRepository {
  Future<Either<Failure, NationPopulationModel>> doGetPopulation();
}
