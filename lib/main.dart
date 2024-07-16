import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//i learnt about: 
//one of the ways to read a value from the created provider
//ConsumerWidgets which are widgets of provider help to access and
// react to the changes made in the state.

//watch() listens to the providers inorder to be know the changes made to the providers state so as to rebuild it
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


class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});
 
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('RIverpod Provider'),
      ),
      body: Center(
        child: Text(name),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
