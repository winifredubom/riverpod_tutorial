import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//i learnt about: 
//one of the other ways to read a value from the created provider if it is a stateful widget
// ref is a parameter type of WidgetRef that allows the widget to interact with the provider
// Use ref.watch when your UI needs to react to changes in a provider's state.
// Use ref.read for one-time operations or to modify state without making updates.

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
      home: const Main(),
    );
  }
}


class Main extends ConsumerStatefulWidget {
  const Main({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainState createState() => _MainState();
}

class _MainState extends ConsumerState<Main> {
  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod'),
      ),
      body: Center(child: 
      Text(name),),
    );
  }
}