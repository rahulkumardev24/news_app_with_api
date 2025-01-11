import 'package:cloud_craft/constants/colors.dart';
import 'package:cloud_craft/data/api/api_helper.dart';
import 'package:cloud_craft/domain/utils.dart';
import 'package:cloud_craft/model/every_news_model.dart';
import 'package:flutter/material.dart';

class SearchNewsScreen extends StatefulWidget {
  const SearchNewsScreen({super.key});

  @override
  State<SearchNewsScreen> createState() => _SearchNewsScreenState();
}

class _SearchNewsScreenState extends State<SearchNewsScreen> {
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  List<Articles> articles = [];

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextField(
                /// controller
                controller: searchController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.primaryLight,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 2, color: AppColors.primary)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 2, color: AppColors.primaryLight)),
                    hintText: "Search News",
                    hintStyle: myTextStyle18(),
                    suffixIcon: IconButton(

                        /// here we call
                        onPressed: () {
                          final searchQuery = searchController.text.trim();
                          if (searchQuery.isNotEmpty) {
                            fetchNews(searchQuery);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                "plz enter news",
                                style: myTextStyle18(
                                    textColor: Colors.white,
                                    textWeight: FontWeight.bold),
                              ),
                              backgroundColor: Colors.red,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(16))),
                            ));
                          }
                        },
                        icon: const Icon(
                          Icons.search_rounded,
                          size: 30,
                          color: AppColors.secondary,
                        ))),
              ),
            ),

            /// Reflect Data here
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : articles.isEmpty
                    ? Center(
                        child: Text(
                          "No News Found",
                          style: myTextStyle18(
                              textColor: AppColors.secondary.withOpacity(0.5)),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          final myArticles = articles[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              tileColor: AppColors.secondary.withOpacity(0.2),
                              leading: myArticles.urlToImage != null
                                  ? Image.network(myArticles.urlToImage!)
                                  : Image.asset("assets/images/newspaper.png"),
                              title: Text(myArticles.title!,
                                  maxLines: 2,
                                  style: myTextStyle14(
                                      textWeight: FontWeight.bold)),
                              subtitle: Text(
                                myArticles?.author ?? "online",
                                maxLines: 1,
                                style: myTextStyle14(
                                    textColor: Colors.blue.shade900),
                              ),
                            ),
                          );
                        },
                      )
          ],
        ),
      ),
    );
  }
}

/// in this screen we search news and get
/// Reflect News on the screen
