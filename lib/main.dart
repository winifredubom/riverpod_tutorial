import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//i learnt about: 
//one of the other ways to read a value from the created provider
// 
final nameProvider = Provider<String>((ref) {
return 'Hello Joy';
});
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
      home: const MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
 
  @override
  Widget build(BuildContext context) {
   // final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('RIverpod Provider'),
      ),
      body: Center(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) { 
            final name = ref.watch(nameProvider);
            return Text(name);
           },),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
