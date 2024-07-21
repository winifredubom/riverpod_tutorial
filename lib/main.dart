
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_practice/counter.dart';
import 'package:riverpod_practice/home.dart';


//i learnt about: 
// AutoDispose Modifier in Riverpod 
// AutoDispose is used to destroy the state of a provider when it is no longer used.
// it is also used to reset the state when a user leaves the screen and re-enters it
// GoRouter dependency was used here, its a declarative routing package used for making navigations in flutter apps simpler
// keepAlive Function is used to tell Riverpod that the state of the provider should be preserved even if no longer listened to
// the Timer was made use of to dispose the providers state after a given duration


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router
    );
  }
}


final GoRouter _router  = GoRouter(routes:[
  GoRoute(path: '/', builder: (context, state) => const Home()),
  GoRoute(path: '/counter', builder: (context, state) => const Counter()),
]);

