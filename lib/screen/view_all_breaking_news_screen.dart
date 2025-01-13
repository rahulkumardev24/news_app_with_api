import 'package:cloud_craft/constants/colors.dart';
import 'package:cloud_craft/domain/utils.dart';
import 'package:cloud_craft/screen/news_details_screen.dart';
import 'package:cloud_craft/widgets/my_icon_button.dart';
import 'package:flutter/material.dart';

import '../data/api/api_helper.dart';
import '../model/every_news_model.dart';

class ViewAllBreakingNewsScreen extends StatefulWidget {
  const ViewAllBreakingNewsScreen({super.key});

  @override
  State<ViewAllBreakingNewsScreen> createState() =>
      _ViewAllBreakingNewsScreenState();
}

class _ViewAllBreakingNewsScreenState extends State<ViewAllBreakingNewsScreen> {
  List<Articles> breakingNews = [];
  bool isLoading = false;

  /// breaking news function
  void fetchBreaking(String query) async {
    setState(() {
      isLoading = true;
    });
    final breakingData = await ApiHelper.fetchNews(query);
    if (breakingData != null && breakingData.articles != null) {
      setState(() {
        breakingNews = breakingData.articles!;
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchBreaking("breaking news");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// _____________Appbar___________________________///
      appBar: AppBar(
        title: Text(
          "Breaking News",
          style: myTextStyle24(textWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: MyIconButton(
            buttonIcon: Icons.arrow_back_rounded,
            onTap: () {
              Navigator.pop(context);
            },
            buttonColor: AppColors.primaryLight.withOpacity(0.5),
          ),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: AppColors.secondary,
              strokeWidth: 5,
            ))
          : GridView.builder(
              itemCount: breakingNews.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                final myNews = breakingNews[index];
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: InkWell(
                    /// when click on card navigate to news details screen
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsDetailsScreen(
                                  imagePath: myNews?.urlToImage ?? "assets/images/newspaper.png",
                                  source: myNews?.source!.name ?? "No Found",
                                  title: myNews?.title ?? "No Found",
                                  desc: myNews?.description ?? "No Found",
                                  cont: myNews?.content ?? "No Found",
                                  time: myNews?.publishedAt ?? "No Found",
                                  author: myNews.author ?? "No Found")));
                    },
                    child: Card(
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          myNews.urlToImage != null
                              ? ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(10)),
                                  child: Image.network(
                                    myNews.urlToImage!,
                                    width: double.infinity,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ))
                              : Center(
                                  child: Image.asset(
                                    "assets/images/newspaper.png",
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Text(
                              myNews.title!,
                              style:
                                  myTextStyle14(textColor: AppColors.secondary),
                              maxLines: 2,
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Text(
                              myNews?.source!.name ?? "No Found",
                              maxLines: 1,
                              style: myTextStyle18(
                                  textWeight: FontWeight.bold,
                                  textColor: AppColors.primary),
                            ),
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

/// in this screen we show data in grid view
/// same function use , that is already use in home screen breaking news slider
/// View All Screen Complete
