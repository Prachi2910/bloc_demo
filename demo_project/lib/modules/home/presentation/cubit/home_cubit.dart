import 'package:bloc/bloc.dart';
import 'package:demo_project/modules/home/data/models/nation_population_model.dart';
import 'package:demo_project/modules/home/domain/usecases/do_nation_population.dart';
import 'package:demo_project/modules/home/presentation/cubit/home_state.dart';
import 'package:demo_project/usecases/usecase.dart';
import 'package:flutter/material.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required DoHome doHome,
  })  : _doHome = doHome,
        super(HomeInitial());

  final DoHome _doHome;

  Future<void> getHome() async {
    try {
      emit(HomeLoading());
      final result = await _doHome(NoParams());
      if (result.isRight()) {
        emit(
          HomeSuccess(
            homeModel: result.getOrElse(() => NationPopulationModel()),
          ),
        );
      } else {
        emit(HomeFailure());
      }
    } catch (e) {
      debugPrint("Throws: $e");
      emit(HomeFailure());
    }
  }
}
