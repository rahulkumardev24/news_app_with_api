import 'package:cloud_craft/domain/utils.dart';
import 'package:cloud_craft/screen/news_details_screen.dart';
import 'package:cloud_craft/widgets/my_icon_button.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../data/api/api_helper.dart';
import '../model/every_news_model.dart';

class TopicNewsScreen extends StatefulWidget {
  /// here we create constructor
  String screenTitle;
  String screenImage;
  TopicNewsScreen(
      {super.key, required this.screenTitle, required this.screenImage});

  @override
  State<TopicNewsScreen> createState() => _TopicNewsScreenState();
}

class _TopicNewsScreenState extends State<TopicNewsScreen> {
  List<Articles> articles = [];
  bool isLoading = false;

  /// create function to fetch news
  void fetchNews(String query) async {
    setState(() {
      isLoading = true;
    });
    final newsData = await ApiHelper.fetchNews(query);
    if (newsData != null && newsData.articles != null) {
      setState(() {
        articles = newsData.articles!;
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNews(widget.screenTitle);
  }

  MediaQueryData? mqData;

  @override
  Widget build(BuildContext context) {
    mqData = MediaQuery.of(context);
    return Scaffold(
      /// ________________Appbar_____________________///
      appBar: AppBar(
          toolbarHeight: 100,
          title: Container(
              decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                child: Text(
                  widget.screenTitle,
                  style: myTextStyle24(
                      textColor: Colors.white, textWeight: FontWeight.bold),
                ),
              )),
          flexibleSpace: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.screenImage),
                      fit: BoxFit.cover))),
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 25),
            child: MyIconButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonColor: AppColors.primaryLight.withOpacity(0.5),
              buttonIcon: Icons.backspace_outlined,
            ),
          )),

      /// here we show news ,
      /// in list view
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
              strokeWidth: 5,
              color: AppColors.secondary,
            ))
          : ListView.builder(
              itemCount: articles.length,
              itemBuilder: (contex, index) {
                final myNews = articles[index];
                return GestureDetector(
                  /// when click on card Navigate to News Details screen
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsDetailsScreen(
                                imagePath: myNews.urlToImage ??
                                    "assets/images/newspaper.png",
                                source: myNews.source!.name ?? "No Found",
                                title: myNews.title ?? "No Found",
                                desc: myNews.description ?? "No Found",
                                cont: myNews.content ?? "No Found",
                                time: myNews.publishedAt ?? "NoFound",
                                author: myNews.author ?? "No Found")));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: mqData!.size.height * 0.15,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(color: Colors.black, blurRadius: 2)
                          ],
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 1,
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.horizontal(
                                      left: Radius.circular(8)),
                                  child: myNews.urlToImage != null
                                      ? Image.network(
                                          myNews?.urlToImage ??
                                              "assets/images/newspaper.png",
                                          fit: BoxFit.cover,
                                          height: double.infinity,
                                        )
                                      : Image.asset(
                                          "assets/images/newspaper.png"))),
                          Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      myNews?.source!.name ?? "No Found",
                                      style: myTextStyle18(
                                          textColor: AppColors.secondary),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      myNews.title!,
                                      style: myTextStyle14(
                                          textWeight: FontWeight.bold,
                                          textColor: AppColors.primary),
                                      maxLines: 3,
                                    ),
                                    const Expanded(
                                        child: SizedBox(
                                      height: 10,
                                    )),
                                    Text(
                                      myNews?.author ?? "No Found",
                                      maxLines: 1,
                                      style: myTextStyle14(
                                          textColor: AppColors.secondary
                                              .withOpacity(0.8)),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}

/// Complete
///
/// by Mistake Topic news screen not record
/// see the code and implement
