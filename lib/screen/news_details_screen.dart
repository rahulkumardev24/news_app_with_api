import 'package:flutter/material.dart';

class NewsDetailsScreen extends StatefulWidget {
  ///here we create constructor
  String imagePath ;

   NewsDetailsScreen({super.key ,
     required this.imagePath ,

   });

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("")
        ],
      ),
    ) ;
  }
}

/// News Details screen
/// in this screen we show Complete details of news
