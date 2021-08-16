import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:yellow_class/modules/home/data/models/movie_model.dart';
import 'package:yellow_class/modules/home/data/services/movie_service.dart';
import 'package:yellow_class/modules/home/views/screen/homepage.dart';
import 'package:yellow_class/modules/home/views/screen/loginPage.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieModelAdapter());
  await Hive.openBox<MovieModel>('movies');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
   providers: [
     ChangeNotifierProvider<MovieService>(
       create: (context) => MovieService(),
     ),
   ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Login(),
      ),
    );
  }


}
