import 'package:demo_project/modules/home/data/models/nation_population_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final NationPopulationModel homeModel;

  const HomeSuccess({required this.homeModel});

  @override
  List<Object> get props => [homeModel];
}

class HomeFailure extends HomeState {}
