import 'package:demo_project/injection_container.dart' as di;
import 'package:demo_project/injection_container.dart';
import 'package:demo_project/modules/home/presentation/cubit/home_cubit.dart';
import 'package:demo_project/modules/home/presentation/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => sl<HomeCubit>()..getHome(),
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(title: 'Flutter Demo Page'),
      ),
    );
  }
}
