import 'package:demo_project/modules/home/data/models/nation_population_model.dart';
import 'package:demo_project/modules/home/presentation/cubit/home_cubit.dart';
import 'package:demo_project/modules/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NationPopulationModel? nationPopulationModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          if (state is HomeSuccess) {
            nationPopulationModel = state.homeModel;
          }
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            itemCount: nationPopulationModel?.data?.length ?? 0,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 16,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 5.0,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        buildRowContent(
                            title: "ID Nation:", content: nationPopulationModel?.data![index].idNation ?? ''),
                        buildRowContent(title: "Nation:", content: nationPopulationModel?.data![index].nation ?? ''),
                        buildRowContent(
                            title: "ID Year:", content: nationPopulationModel?.data![index].idYear.toString() ?? ''),
                        buildRowContent(title: "Year:", content: nationPopulationModel?.data![index].year ?? ''),
                        buildRowContent(
                            title: "Slug Nation:", content: nationPopulationModel?.data![index].slugNation ?? ''),
                        buildRowContent(
                            title: "Population:",
                            content: nationPopulationModel?.data![index].population.toString() ?? ''),
                      ],
                    )),
              );
            },
          );
        }));
  }

  Widget buildRowContent({required String title, required String content}) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          content,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
