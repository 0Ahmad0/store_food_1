import 'package:fatema_1/screen/home_page.dart';
import 'package:fatema_1/screen/search_page.dart';
import 'package:fatema_1/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> Auth()),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.pink,
        primarySwatch: Colors.pink,
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold,color: Colors.white),
            headline2: TextStyle(fontSize: 14.0, color: Colors.white),
            headline3: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
      ),
      home:  HomeScreen(),
    );
  }
}
