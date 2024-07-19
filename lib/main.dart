import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/counter_demo.dart';

//i learnt about: 
// The third type of provider which is StateNotifierProvider
// It is a provider that is used to listen to and expose a StateNotifier, in which working hand in hand, they manage state which may change in reaction to a user reaction
// It is used for centralizing Business logic in a single place and improving maintainability of the code over time
//  


final counterProvider = StateNotifierProvider<CounterDemo, int>((ref) => CounterDemo());
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Main(),
    );
  }
}


class Main extends ConsumerWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
        actions: [
          IconButton(
            onPressed:(){
                          } ,
            icon: const Icon(Icons.refresh))
        ],
      ),
      body:   Center(
        child: Text(
          '$counter',
           style: const TextStyle(
            fontSize: 20
          ),
        ),
      ),
      floatingActionButton: 
      FloatingActionButton(onPressed: (){
        ref.read(counterProvider.notifier).increment();
      },
      child: const Icon(Icons.add),),
    );
  }
}