
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/user.dart';

//i learnt about: 
// how to change theme from Light to Dark and vice versa


final themeprovider  = StateProvider<bool>((ref) => true);
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
final isLightTheme = ref.watch(themeprovider);

    return MaterialApp(
      title: 'Theme',
      debugShowCheckedModeBanner: false,
      theme:  isLightTheme? ThemeData.light(): ThemeData.dark(),
      home: const Main()
    );
  }
}

class Main extends ConsumerWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLightTheme = ref.watch(themeprovider);


    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          'Theme'
        ),
      ),
      body: Center(
        child: Switch(
          activeColor: Colors.blue,
          value: isLightTheme , onChanged: (value){
            ref.read(themeprovider.notifier).state = value;
          }),
      ),
    );
  }
}


