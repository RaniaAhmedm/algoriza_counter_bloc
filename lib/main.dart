import 'package:counter_bloc/bloc/States/bloc.dart';
import 'package:counter_bloc/screens/counter_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/Users/users_screen.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => BlocApp()..initDatabase(),
    )
  ], child: const MyApp()));
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
        UsersScreen.routeName: (context) => const UsersScreen(),
      },
      initialRoute: UsersScreen.routeName,
    );
  }
}
