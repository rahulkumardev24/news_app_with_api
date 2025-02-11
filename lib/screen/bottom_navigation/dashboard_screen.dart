import 'package:cloud_craft/constants/colors.dart';
import 'package:cloud_craft/screen/bottom_navigation/bookmark_screen.dart';
import 'package:cloud_craft/screen/bottom_navigation/categories_screen.dart';
import 'package:cloud_craft/screen/bottom_navigation/home_screen.dart';
import 'package:cloud_craft/screen/bottom_navigation/profile_screen.dart';
import 'package:cloud_craft/screen/bottom_navigation/serach_news_screen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  /// here we call call these screen
  List<Widget> screen = [
    const HomeScreen(),
    SearchNewsScreen(),
    const CategoriesScreen(),
    const BookmarkScreen(),
    const ProfileScreen(),
  ];

  int currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentScreen,
        children: screen,
      ),
      bottomNavigationBar: ConvexAppBar(
          style: TabStyle.flip,
          backgroundColor: AppColors.primary,
          onTap: (index) {
            currentScreen = index;
            setState(() {});
          },
          items:  [
            const TabItem(
              icon: Center(child: FaIcon(FontAwesomeIcons.house)),
              title: "Home",
            ),
            const TabItem(
                icon: Center(child: FaIcon(FontAwesomeIcons.magnifyingGlass)),
                title: "Search"),
            const TabItem(
                icon: Center(child: FaIcon(FontAwesomeIcons.globe)),
                title: "Categories"),
            const TabItem(
                icon: Center(child: FaIcon(FontAwesomeIcons.bookBookmark)),
                title: "Save"),
            TabItem(
                icon: Center(child: ClipRRect(borderRadius: BorderRadius.circular(100),
                    child: Image.asset("assets/images/pr.jpg"))),
                title: "Profile"),
          ]),
    );
  }
}

/// DASHBOARD SCREEN COMPLETE