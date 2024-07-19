import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//i learnt about: 
// The fourth type of provider which is StreamProvider
// It is a provider that depends on Stream instead of Future like the futureProvider
// It is used to get data from real-time database
// 


//this would provide data after an interval of two seconds
final streamProvider = StreamProvider<int>(((ref) {
  return Stream.periodic(const Duration(seconds: 2), ((computationCount) => computationCount));
}));



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
      debugShowCheckedModeBanner: false,
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
    final streamData = ref.watch(streamProvider);
 
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
        actions: [
          IconButton(
            onPressed:(){ } ,
            icon: const Icon(Icons.refresh))
        ],
      ),
      body: streamData.when(
        data: ((data) =>  Center(
          child:  Text(
            data.toString(),
            style:const  TextStyle(
              fontSize: 25,
            ),
          ),
        )),
         error: ((error, stackTrace) => Text(error.toString())),
          loading: () =>const  Center(
            child: CircularProgressIndicator(),
          ))
      );
  }
}