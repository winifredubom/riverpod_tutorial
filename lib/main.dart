
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/user.dart';



//i learnt about: 
// Family Modifier(multiple values) in Riverpod 
// They are used to pass values to a provider

final nameProvider = Provider.family<String, User>(
  (ref, user) {
    return 'Name: ${user.name} and Address: ${user.address} ';
  }
);
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
      home: const Main()
    );
  }
}


class Main extends ConsumerStatefulWidget {
  const Main({super.key});

  @override
  _MainState createState() => _MainState();
}

class _MainState extends ConsumerState<Main> {
  @override
  Widget build(BuildContext context) {
    final name = ref.watch(
      nameProvider(const User('Joy', 'Lagos')));

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Family Modifier'),
      ),
      body: Center(
        child: Text(name,
        style: 
       const TextStyle(
          fontSize: 20
        )),),
    );
  }
}

