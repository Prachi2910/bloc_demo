import 'package:demo_project/modules/home/data/datasources/home_data_source.dart';
import 'package:demo_project/modules/home/data/repositories/home_repository_impl.dart';
import 'package:demo_project/modules/home/domain/repositories/home_repository.dart';
import 'package:demo_project/modules/home/domain/usecases/do_nation_population.dart';
import 'package:demo_project/modules/home/presentation/cubit/home_cubit.dart';
import 'package:get/get.dart' as getx;
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //? Bloc/Cubit
  sl.registerFactory<HomeCubit>(
    () => HomeCubit(
      doHome: sl(),
    ),
  );

  //? Use cases

  sl.registerLazySingleton<DoHome>(() => DoHome(sl()));

  //? Repository

  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      dataSource: sl(),
    ),
  );

  //? Data sources

  sl.registerLazySingleton<HomeDataSource>(
    () => HomeDataSourceImpl(),
  );

  //? External
  sl.registerLazySingleton(() => getx.Get);
}
