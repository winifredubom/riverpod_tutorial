import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/api_service.dart';
import 'package:riverpod_practice/user_model.dart';

//i learnt about: 
// The third type of provider which is StateNotifierProvider
// It is a provider that is used to listen to and expose a StateNotifier, in which working hand in hand, they manage state which may change in reaction to a user reaction
// It is used for centralizing Business logic in a single place and improving maintainability of the code over time
// How to make use of FutureProvider to  

final apiProvider = Provider<ApiService>(
  (ref) => ApiService(),
  );


final userDataProvider = FutureProvider<List<UserModel>>((ref){
return ref.read(apiProvider).getUser();
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
    final userData = ref.watch(userDataProvider);
 
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
      body: userData.when(
        data: (data){
          return ListView.builder(
            itemBuilder: ((context, index){
              return ListTile(
                title: Text('${data[index].firstName} ${data[index].lastName}'),
                subtitle: Text(data[index].email),
                leading: CircleAvatar(
                  child: Image.network(data[index].avatar)
                )
              );
            } 
            ),
            itemCount: data.length,);
        },
         error: ((error, stackTrace) => Text(error.toString())), 
        loading: ((){
          return const Center(
            child:  CircularProgressIndicator(),
          );
        }))
      );
  }
}