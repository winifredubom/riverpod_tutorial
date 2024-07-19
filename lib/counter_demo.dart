import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterDemo extends StateNotifier<int>
{
  CounterDemo():super(0);

  //funcntion to increase the state by 1
  void increment(){
    state++;
  }
}