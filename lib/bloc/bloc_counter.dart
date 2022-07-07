import 'package:counter_bloc/bloc/States/bloc_States.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocCounter extends Cubit<BlocState> {
  BlocCounter() : super(InitialState());
  int counter = 0;
  void incrementCounter() {
    counter++;
    emit(IncrementCounter());
  }

  void decrementCounter() {
    counter--;
    emit(DecrementCounter());
  }
}


