import 'package:coded_social_media/models/users.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

class LikePage extends StatefulWidget {
  const LikePage({super.key});

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  int currentIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: likedPosts.length,
            itemBuilder: (context, index) {
              final user = likedPosts[index];
              return SizedBox(
                  height: 120,
                  child: InkWell(
                      child: GestureDetector(
                          onTap: () {
                            showPost(context, likedPosts[index].post);
                          },
                          child: Card(
                              margin: const EdgeInsets.only(
                                  right: 20, left: 20, top: 5),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                likedPosts[index].avatar))),
                                    Column(children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 30, left: 8),
                                          child: Text(user.username,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Text(likedPosts[index].caption)
                                    ]),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(left: 100),
                                        child: FavoriteButton(
                                            isFavorite: likedPosts[index].liked,
                                            iconDisabledColor: Colors.red,
                                            valueChanged: (isFavorite) {
                                              setState(() {
                                                likedPosts[index].liked = false;
                                                likedPosts =
                                                    Users.users.where((user) {
                                                  final likedpost =
                                                      user.liked.toString();
                                                  return likedpost
                                                      .contains("true");
                                                }).toList();
                                              });
                                            }))
                                  ])))));
            }));
  }

  List<Users> likedPosts = Users.users.where((user) {
    final likedpost = user.liked.toString();
    return likedpost.contains("true");
  }).toList();
}

showPost(context, img) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
            child: ClipRRect(child: Image.asset(img, height: 300, width: 300)));
      });
}
