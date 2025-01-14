import 'dart:async';

import 'package:cloud_craft/constants/colors.dart';
import 'package:cloud_craft/domain/utils.dart';
import 'package:cloud_craft/screen/bottom_navigation/dashboard_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2) , (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 200,),
            Image.asset(
              "assets/icons/news.png",
              height: 200,
              width: 200,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Cloud Craft",
              style: myTextStyle32(
                  textWeight: FontWeight.bold, textColor: AppColors.primary),
            ),
            const Spacer(),
            Text(
              "News Center",
              style: myTextStyle24(
                  textColor: AppColors.secondary.withOpacity(0.5),
                  textWeight: FontWeight.bold),
            ) ,
            const SizedBox(height: 21,)

          ],
        ),
      ),
    );
  }
}

///Splash Screen
