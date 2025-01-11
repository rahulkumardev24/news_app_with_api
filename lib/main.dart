import 'package:cloud_craft/screen/serach_news_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SearchNewsScreen(),
    );
  }
}




/// IN THIS VIDEO WE CREATE News App
/// COMPLETE NEWS APP
/// FREE API HIT
/// Simple Steps
/// Step 1
/// Project Setup => Done
/// Step 2
/// Api find and model create => DONE
/// find api link in the description box
/// url => https://newsapi.org/docs/endpoints/everything
/// this is my API Key => 2229dabd1a32432ca9b279d40d523c6e
/// flow steps to get api key
/// data fetch => DONE
/// Details Screen =>