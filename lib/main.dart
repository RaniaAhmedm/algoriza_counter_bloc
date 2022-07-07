import 'package:counter_bloc/bloc/bloc_counter.dart';
import 'package:counter_bloc/counter_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context)=>BlocCounter(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter',
      routes: {
        CounterScreen.routeName: (context) => const CounterScreen(),
      },
      initialRoute: CounterScreen.routeName,
    );
  }
}
