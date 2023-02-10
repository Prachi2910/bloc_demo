import 'package:dartz/dartz.dart';
import 'package:demo_project/modules/home/data/models/nation_population_model.dart';
import 'package:demo_project/modules/home/domain/repositories/home_repository.dart';
import 'package:demo_project/usecases/usecase.dart';

class DoHome implements UseCase<NationPopulationModel, NoParams> {
  DoHome(this.repository);

  final HomeRepository repository;

  @override
  Future<Either<Failure, NationPopulationModel>> call(NoParams params) async {
    return repository.doGetPopulation();
  }
}
