import 'package:cloud_craft/constants/colors.dart';
import 'package:cloud_craft/domain/utils.dart';
import 'package:flutter/material.dart';

class NewsDetailsScreen extends StatefulWidget {
  ///here we create constructor
  String imagePath;
  String source;
  String title;
  String desc;
  String cont;
  String time;
  String author;

  NewsDetailsScreen(
      {super.key,
      required this.imagePath,
      required this.source,
      required this.title,
      required this.desc,
      required this.cont,
      required this.time,
      required this.author});

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  MediaQueryData? mqData;
  @override
  Widget build(BuildContext context) {
    mqData = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            widget.imagePath,
          ),

          /// back Button
          Positioned(
              top: 50,
              left: 10,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                backgroundColor: AppColors.secondary.withOpacity(0.6),
                child: const Icon(
                  Icons.arrow_back_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: mqData!.size.height * 0.78,
              width: mqData!.size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(35))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),

                    /// Source
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/check-mark (1).png",
                          height: 40,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          widget.source,
                          style: myTextStyle18(
                              textWeight: FontWeight.bold,
                              textColor: AppColors.primary),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),

                    /// title
                    Text(
                      widget.title,
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.red,
                          decorationThickness: 2,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'primary'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    /// time show
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          "assets/icons/clock.png",
                          height: 30,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(6)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.time,
                                style: myTextStyle14(
                                    textColor: Colors.white,
                                    textWeight: FontWeight.bold),
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.desc,
                      style: myTextStyle18(),
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      widget.cont,
                      style: myTextStyle18(),
                    ),

                    const Divider(),
                    const SizedBox(
                      height: 8,
                    ),

                    Container(
                      width: mqData!.size.width * 0.6,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 2, color: AppColors.primaryLight),
                          boxShadow: const [
                            BoxShadow(blurRadius: 3, color: Colors.black)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/verified-profile.png",
                            height: 40,
                          ),
                          Text(
                            widget.author,
                            style: myTextStyle18(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

/// News Details screen
/// in this screen we show Complete details of news
/// complete Details screen =>
