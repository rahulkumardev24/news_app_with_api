import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_craft/constants/colors.dart';
import 'package:cloud_craft/domain/utils.dart';
import 'package:flutter/material.dart';

import '../widgets/my_icon_button.dart';

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

          widget.imagePath != null
              ? CachedNetworkImage(
            imageUrl: widget.imagePath,
            placeholder: (context , url)=> const Center(child: CircularProgressIndicator()),
            errorWidget: (context , url , error) => const Center(child: Icon(Icons.error)),
                )
              : Image.asset("assets/images/newspaper.png"),

          /// back Button
          Positioned(
              top: 50,
              left: 10,
              child: MyIconButton(
                buttonIcon: Icons.arrow_back_rounded,
                onTap: () {
                  Navigator.pop(context);
                },
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

                    Flexible(
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/verified-profile.png",
                            height: 40,
                          ),
                          Expanded(
                            child: Text(
                              widget.author,
                              maxLines: 2,
                              style: myTextStyle18(),
                            ),
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
