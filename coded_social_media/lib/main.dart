import 'package:coded_social_media/add_post_page.dart';
import 'package:coded_social_media/home.dart';
import 'package:coded_social_media/like_page.dart';
import 'package:coded_social_media/search_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int currentIndex = 0;
  final screens = [
    const Home(),
    const SearchPage(),
    const AddPostPage(),
    const LikePage()
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.grey,
                leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                        "images/17c8be8940233b083ad4a4dbe4f1cf61.png")),
                title: const Text("KC Social Media",
                    style: TextStyle(color: Colors.white))),
            body: screens[currentIndex],
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: currentIndex,
                onTap: (index) => setState(() => currentIndex = index),
                iconSize: 30,
                backgroundColor: Colors.grey,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white,
                showUnselectedLabels: false,
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home, color: Colors.white),
                      label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search, color: Colors.white),
                      label: "Search"),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add_photo_alternate, color: Colors.white),
                    label: "Create Post",
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_border, color: Colors.white),
                      label: "Liked Posts")
                ])));
  }
}
