import 'package:cloud_craft/domain/utils.dart';
import 'package:cloud_craft/screen/topic_news_screen.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../data/api/api_helper.dart';
import '../../model/every_news_model.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  /// here we create list of news list
  List<Map<String, dynamic>> topicNews = [
    {
      "title": "Technology",
      "image": "assets/images/technology.jpg",
    },
    {
      "title": "Weather",
      "image": "assets/images/weather.jpg",
    },
    {
      "title": "Sports",
      "image": "assets/images/sports.jpg",
    },
    {
      "title": "Space",
      "image": "assets/images/space.jpg",
    },
    {
      "title": "Science",
      "image": "assets/images/science.jpg",
    },
    {
      "title": "Politics",
      "image": "assets/images/Politics.jpg",
    },
    {
      "title": "Environment",
      "image": "assets/images/Environment.jpg",
    },
    {
      "title": "Entertainment",
      "image": "assets/images/Entertainment.jpg",
    },
    {
      "title": "Education",
      "image": "assets/images/education.jpg",
    },
    {
      "title": "Crime",
      "image": "assets/images/crime.jpg",
    },
    {
      "title": "Business",
      "image": "assets/images/Business.jpg",
    },
    {
      "title": "Bitcoin",
      "image": "assets/images/bitcoin.jpg",
    },
  ];

  MediaQueryData? mqData;
  @override
  Widget build(BuildContext context) {
    mqData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Topic Based News",
          style: myTextStyle24(textWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,

      ///......BODY.......///
      body: GridView.builder(
          itemCount: topicNews.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.9),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TopicNewsScreen(
                                screenTitle: topicNews[index]['title'],
                                screenImage: topicNews[index]['image'],
                              )));
                },
                child: Card(
                  elevation: 4,
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10)),
                          child: Image.asset(
                            topicNews[index]['image'],
                            height: mqData!.size.height * 0.2,
                            width: mqData!.size.width,
                            fit: BoxFit.cover,
                          )),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        topicNews[index]['title'],
                        style: myTextStyle18(
                            textColor: AppColors.primary,
                            textWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

/// this is Categories screen
/// In this screen we show Topic wise News
/// when click on topic card Navigate to topic screen to Show All News
/// Complete
///
