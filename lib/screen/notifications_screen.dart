import 'package:cloud_craft/constants/colors.dart';
import 'package:cloud_craft/domain/utils.dart';
import 'package:cloud_craft/widgets/my_icon_button.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: myTextStyle24(textWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(7.0),
          child: MyIconButton(
              buttonIcon: Icons.arrow_back_rounded,
              buttonColor: AppColors.primaryLight.withOpacity(0.5),
              onTap: () {
                Navigator.pop(context);
              }),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/notification_data.png",
              height: 100,
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              "No Notifications Found",
              style: myTextStyle18(
                  textColor: AppColors.secondary.withOpacity(0.8),
                  textWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

/// Notification screen Complete