import 'package:cloud_craft/screen/bottom_navigation/categories_screen.dart';
import 'package:cloud_craft/screen/bottom_navigation/dashboard_screen.dart';
import 'package:cloud_craft/screen/bottom_navigation/profile_screen.dart';
import 'package:cloud_craft/screen/bottom_navigation/serach_news_screen.dart';
import 'package:cloud_craft/screen/notifications_screen.dart';
import 'package:cloud_craft/screen/splash_screen.dart';
import 'package:cloud_craft/screen/view_all_breaking_news_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
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
/// Details Screen => DONE
///
/// Step 3
/// Dashboard screen Create => DONE
///
/// Step 4
/// Home Screen => Done
///
/// Step 5
/// Notifications Screen => DONE
///
/// Step 6
/// View All Breaking news Screen => DONE
///
/// Step 7
/// categories screen => DONE
///
/// Step 8
/// Save Screen => DONE

/// Step 9
/// Profile Screen => DONE
///
/// Step 10
/// Splash Screen => Done
///
/// Step 11
/// Final review and solve some problem
///
/// Step 12
/// App Icon Change => DONE
///
/// ____________________________________Final Test_________________________________________
/// ___________________________________-OUR PROJECT IS READY-______________________________
///
///
///
///
///
///
///
///
