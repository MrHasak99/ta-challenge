import 'package:coded_social_media/models/users.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: Users.users.length,
            itemBuilder: (context, index) {
              return Card(
                  elevation: 0,
                  margin: const EdgeInsets.only(right: 10, left: 10, top: 5),
                  child: Column(children: [
                    Row(children: [
                      Padding(
                          padding: const EdgeInsets.all(8),
                          child: CircleAvatar(
                              backgroundImage:
                                  AssetImage(Users.users[index].avatar))),
                      Text(Users.users[index].username)
                    ]),
                    Image.network(Users.users[index].post,
                        height: 300, width: 300),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text(Users.users[index].caption)])),
                    Row(children: [
                      Padding(
                          padding: const EdgeInsets.all(4),
                          child: FavoriteButton(
                              isFavorite: Users.users[index].liked,
                              iconDisabledColor: Colors.black,
                              valueChanged: (isFavorite) {
                                setState(() {
                                  Users.users[index].liked = isFavorite;
                                });
                              })),
                      const Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(Icons.add_comment_outlined)),
                      const Padding(
                          padding: EdgeInsets.all(4), child: Icon(Icons.share))
                    ])
                  ]));
            }));
  }
}
