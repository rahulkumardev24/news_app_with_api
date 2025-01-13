import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_craft/constants/colors.dart';
import 'package:cloud_craft/domain/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../data/api/api_helper.dart';
import '../../model/every_news_model.dart';
import '../news_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool isLoading = false;
  List<Articles> headingNews = [];
  List<Articles> breakingNews = [];
  String currentCountry = "World";
  late TabController tabController;

  /// here we create List of Country
  final List<String> countries = [
    "World",
    "Us",
    "India",
    "China",
    "United Kingdom",
    "Canada",
    "Australia",
    "Germany",
    "France",
    "Japan",
    "Brazil",
  ];

  /// create function to fetch top Heading
  void fetchHeading(String country) async {
    setState(() {
      isLoading = true;
    });
    final headingData = await ApiHelper.topHeading(country);
    if (headingData != null && headingData.articles != null) {
      setState(() {
        headingNews = headingData.articles!;
        isLoading = false;
      });
    }
  }

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

  /// here we call function inside the init method"
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: countries.length, vsync: this);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        currentCountry = countries[tabController.index];
        fetchHeading(currentCountry);
      }
    });
    fetchBreaking("breaking news");
    fetchHeading(currentCountry);
  }

  MediaQueryData? mqdata;
  @override
  Widget build(BuildContext context) {
    mqdata = MediaQuery.of(context);
    return DefaultTabController(
      length: countries.length,
      child: Scaffold(
        /// ________________App Bar______________________________///
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Text(
                "Hello",
                style: myTextStyle24(),
              ),
              const SizedBox(
                width: 10,
              ),
              DefaultTextStyle(
                style: myTextStyle18(
                    textColor: AppColors.primary, textWeight: FontWeight.bold),
                child: AnimatedTextKit(
                  totalRepeatCount: 100,
                  animatedTexts: [
                    RotateAnimatedText("Developer"),
                    RotateAnimatedText("Good Morning"),
                  ],
                ),
              ),
            ],
          ),
          leading: const Icon(
            Icons.account_circle,
            size: 45,
          ),
          actions: const [
            FaIcon(
              FontAwesomeIcons.bell,
              size: 30,
            ),
            SizedBox(
              width: 12,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Here we show Breaking News
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Breaking News",
                      style: myTextStyle24(textWeight: FontWeight.bold),
                    ),
                    Text(
                      "View All",
                      style: myTextStyle18(textColor: AppColors.primary),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              /// Breaking news show in image slider
              CarouselSlider(

                  /// inside the items we show breaking news
                  items: breakingNews.isEmpty
                      ? [
                          const Center(
                              child: CircularProgressIndicator(
                            color: AppColors.secondary,
                            strokeWidth: 5,
                          ))
                        ]
                      : breakingNews.map((article) {
                          /// when click on slider navigate to details screen
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewsDetailsScreen(
                                    imagePath: article.urlToImage ??
                                        "assets/images/default_image.png",
                                    source: article.source?.name ??
                                        "Unknown Source",
                                    title:
                                        article.title ?? "No Title Available",
                                    desc: article.description ??
                                        "No Description Available",
                                    cont: article.content ??
                                        "No Content Available",
                                    time: article.publishedAt ??
                                        "No Time Available",
                                    author: article.author ?? "Anonymous",
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              color: Colors.white10.withOpacity(0.7),
                              elevation: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Stack(
                                      children: [
                                        /// poster
                                        ClipRRect(
                                          borderRadius:
                                              const BorderRadius.vertical(
                                                  top: Radius.circular(20)),
                                          child: article.urlToImage != null
                                              ? Image.network(
                                                  article.urlToImage!,
                                                  fit: BoxFit.cover,
                                                  width: double.infinity,
                                                )
                                              : Image.asset(
                                                  "assets/images/newspaper.png"),
                                        ),
                                        Positioned(
                                            top: 8,
                                            right: 10,
                                            child: Image.asset(
                                              "assets/images/breaking-news.png",
                                              height: 50,
                                            ))
                                      ],
                                    ),
                                  ),

                                  /// Title
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 4),
                                    child: Text(
                                      article.title!,
                                      style: myTextStyle18(
                                          textColor: Colors.black),
                                      maxLines: 2,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/microphone.png",
                                        width: 50,
                                      ),
                                      Text(
                                        article.source?.name ?? "Not Found",
                                        style: myTextStyle18(
                                            textColor: AppColors.primary,
                                            textWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                  options: CarouselOptions(
                    height: mqdata!.size.height * 0.35,
                    aspectRatio: 16 / 14,
                    viewportFraction: 0.98,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 8),
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  )),

              const SizedBox(
                height: 16,
              ),

              /// Latest Heading
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Headlines",
                      style: myTextStyle24(textWeight: FontWeight.bold),
                    ),
                    Text(
                      "View All",
                      style: myTextStyle18(textColor: AppColors.primary),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),

              ///______________________________TAB BAR____________________________________///
              /// here we create Custom Tab bar
              /// show All , India , USA , China , Pakistan , srilankya , ............... Many More
              TabBar(
                isScrollable: true,
                tabs: countries.asMap().entries.map((entry) {
                  final index = entry.key;
                  final country = entry.value;
                  final isSelected = country == currentCountry;
                  return Container(
                    decoration: BoxDecoration(
                        color: isSelected ? AppColors.primary : Colors.white,
                        border: Border.all(width: 2, color: AppColors.primary),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Text(
                        country,
                        style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: "primary"),
                      ),
                    ),
                  );
                }).toList(),
                controller: tabController,
                indicator: const BoxDecoration(color: Colors.transparent),
                labelPadding: const EdgeInsets.symmetric(horizontal: 8),
              ),
              isLoading
                  ? const Center(
                      child: Padding(
                      padding: EdgeInsets.only(top: 21.0),
                      child: CircularProgressIndicator(
                        color: AppColors.secondary,
                        strokeWidth: 5,
                      ),
                    ))
                  : headingNews.isEmpty
                      ? const CircularProgressIndicator(
                          strokeWidth: 5,
                          color: AppColors.secondary,
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: headingNews.length,
                          itemBuilder: (context, index) {
                            final myHeading = headingNews[index];

                            /// Design Heading News
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 6),
                              child: ListTile(
                                tileColor: Colors.black12,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    side: const BorderSide(
                                        width: 1, color: AppColors.primary)),
                                title: Text(
                                  "${myHeading.title}",
                                  maxLines: 2,
                                  style: myTextStyle18(
                                      textWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  "${myHeading.source!.name}",
                                  style: myTextStyle18(
                                      textColor: AppColors.primary,
                                      textWeight: FontWeight.bold),
                                  maxLines: 1,
                                ),
                                leading: myHeading.urlToImage != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.network(
                                          "${myHeading.urlToImage}",
                                          width: 80,
                                          fit: BoxFit.cover,
                                          height: 80,
                                        ))
                                    : Image.asset(
                                        "assets/images/newspaper.png"),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NewsDetailsScreen(
                                              imagePath: myHeading.urlToImage ??
                                                  "assets/images/newspaper.png",
                                              source: myHeading.source?.name ??
                                                  "No Found",
                                              title:
                                                  myHeading.title ?? "No Found",
                                              desc: myHeading.description ??
                                                  "No Found",
                                              cont: myHeading.content ??
                                                  "No Found",
                                              time: myHeading.publishedAt ??
                                                  "No Found",
                                              author: myHeading.author ??
                                                  "No Found")));
                                },
                              ),
                            );
                          },
                        ),
            ],
          ),
        ),
      ),
    );
  }
}

/// HOME SCREEN
/// in this screen we show Headline of all Country and world
/// get headlines
///
/// Breaking News fetch => DONE
///
/// Headlines Show => Done
/// Home screen Done => CHECK => Solve all error
