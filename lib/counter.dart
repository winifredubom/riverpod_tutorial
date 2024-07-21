import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/counter_demo.dart';


final counterProvider = StateNotifierProvider.autoDispose<CounterDemo, int>(((ref){
   //ref.keepAlive();
   final  link = ref.keepAlive();
   final timer = Timer(const Duration(seconds: 10), (){
    link.close();
   });

   ref.onDispose((() => timer.cancel()));
   return CounterDemo();
}));

class Counter extends ConsumerWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body:  Center(
        child: Text('$counter',
        style: const TextStyle(
          fontSize: 25
        ),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ref.read(counterProvider.notifier).increment();
        },
        child: const Icon(Icons.add),),
    );
  }
}