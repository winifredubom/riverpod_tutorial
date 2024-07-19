import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//i learnt about: 
//The second type of provider which is StateProvider
//This type of provider is used to store simple mutable object that cant be changed like:
//String, enum, boolean. But it cant be used to store complex objects
// ref. watch is used to observe the provider state inside the build method and when the provider value changes it rebuilds the widget
// ref.read is used to read the provider value once 
// 


final counterProvider = StateProvider<int>(
  (ref) => 0
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
    final count = ref.watch(counterProvider);

// ref.listen is to listen to the changes made
    ref.listen(counterProvider, ((previous, next) {
      if (next == 5)
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('The Value is $next')));
      }
    }));
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
        actions: [
          IconButton(
            onPressed:(){
              ref.invalidate(counterProvider);
              // or
             // ref.refresh(counterProvider);
                          } ,
            icon: const Icon(Icons.refresh))
        ],
      ),
      body:  Center(
        child: Text(
          count.toString(),
           style: const TextStyle(
            fontSize: 20
          ),
        ),
      ),
      floatingActionButton: 
      FloatingActionButton(onPressed: (){
        ref.read(counterProvider.notifier).state++;
        // or
       // ref.read(counterProvider.notifier).update((state) => state + 1); 
      },
      child: const Icon(Icons.add),),
    );
  }
}