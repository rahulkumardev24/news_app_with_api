import 'package:cloud_craft/domain/utils.dart';
import 'package:cloud_craft/widgets/my_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  MediaQueryData? mqData;
  @override
  Widget build(BuildContext context) {
    mqData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Profile",
          style: myTextStyle24(textWeight: FontWeight.bold),
        ),
        actions: [
          Image.asset(
            "assets/icons/garage.png",
            height: 30,
            color: AppColors.secondary,
          ),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: mqData!.size.height * 0.35,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        "assets/images/background.jpg",
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      left: 125,
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            border: Border.all(width: 4, color: Colors.white),
                            borderRadius: BorderRadius.circular(100),
                            image: const DecorationImage(
                                image: AssetImage("assets/images/pr.jpg"),
                                fit: BoxFit.cover)),
                      )),
                  Positioned(
                      bottom: 20,
                      right: 134,
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: MyIconButton(
                          buttonIcon: Icons.edit_note,
                          onTap: () {},
                          buttonColor: Colors.greenAccent,
                        ),
                      ))
                ],
              ),
            ),
            Text(
              "Rahul Kumar ",
              style: myTextStyle24(textWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
              child: Container(
                width: mqData!.size.width,
                height: mqData!.size.height * 0.11,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.secondary.withOpacity(0.2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "1500",
                            style: myTextStyle32(textWeight: FontWeight.bold),
                          ),
                          Text(
                            "Likes News",
                            style: myTextStyle18(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "19",
                                style:
                                    myTextStyle32(textWeight: FontWeight.bold),
                              ),
                              Text(
                                "Collections",
                                style: myTextStyle18(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "117",
                            style: myTextStyle32(textWeight: FontWeight.bold),
                          ),
                          Text(
                            "Flowing",
                            style: myTextStyle18(),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),

            /// Account Setting
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Account Setting ",
                    style: myTextStyle18(textWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: MyIconButton(
                buttonIcon: Icons.person,
                onTap: () {},
                iconColor: AppColors.secondary,
                buttonColor: AppColors.primaryLight.withOpacity(0.8),
              ),
              title: Text(
                "Your Profile",
                style: myTextStyle18(textWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Edit and view profile info",
                style: myTextStyle14(),
              ),
              trailing: const Icon(
                Icons.navigate_next,
                color: AppColors.secondary,
              ),
            ),
            const SizedBox(
              height: 16,
            ),

            /// App Setting
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "App Setting",
                    style: myTextStyle24(textWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: MyIconButton(
                buttonIcon: Icons.brightness_4,
                onTap: () {},
                iconColor: AppColors.secondary,
                buttonColor: Colors.greenAccent.shade200,
              ),
              title: Text(
                "Display Performance",
                style: myTextStyle18(textWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Adjust Your Display",
                style: myTextStyle14(),
              ),
              trailing: const Icon(
                Icons.navigate_next,
                color: AppColors.secondary,
              ),
            ),
            ListTile(
              leading: MyIconButton(
                buttonIcon: Icons.notifications,
                onTap: () {},
                iconColor: AppColors.secondary,
                buttonColor: Colors.yellow.shade200,
              ),
              title: Text(
                "Notifications",
                style: myTextStyle18(textWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "on/off notifications",
                style: myTextStyle14(),
              ),
              trailing: const Icon(
                Icons.navigate_next,
                color: AppColors.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Profile screen Complete
