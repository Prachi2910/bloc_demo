import 'package:dartz/dartz.dart';
import 'package:demo_project/modules/home/data/datasources/home_data_source.dart';
import 'package:demo_project/modules/home/data/models/nation_population_model.dart';
import 'package:demo_project/modules/home/domain/repositories/home_repository.dart';
import 'package:demo_project/usecases/usecase.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl({
    required this.dataSource,
  });

  final HomeDataSource dataSource;

  @override
  Future<Either<Failure, NationPopulationModel>> doGetPopulation() async {
    try {
      final NationPopulationModel plansModel = await dataSource.doGetPopulation();
      return Right(plansModel);
    } catch (e, st) {
      print("exception : $e : $st");
      rethrow;
    }
  }
}
