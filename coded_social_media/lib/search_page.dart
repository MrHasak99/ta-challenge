import 'package:coded_social_media/models/users.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController controller = TextEditingController();
  List<Users> filteredUser = Users.users;
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                      labelText: "Search for User",
                      suffixIcon: Icon(Icons.search)),
                  onChanged: searchUser),
              Expanded(
                  child: ListView.builder(
                      itemCount: filteredUser.length,
                      itemBuilder: (context, index) {
                        final user = filteredUser[index];
                        return SizedBox(
                            height: 120,
                            child: InkWell(
                                child: GestureDetector(
                                    onTap: () {
                                      showPost(
                                          context, Users.users[index].post);
                                    },
                                    child: Card(
                                        elevation: 0,
                                        margin: const EdgeInsets.only(
                                            right: 20, left: 20, top: 10),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      Users.users[index]
                                                          .avatar)),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8),
                                                  child: Text(user.username,
                                                      style: const TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold)))
                                            ])))));
                      }))
            ])));
  }

  void searchUser(String query) {
    setState(() {
      filteredUser = Users.users.where((user) {
        final userName = user.username.toLowerCase();
        final input = query.toLowerCase();
        return userName.contains(input);
      }).toList();
    });
  }
}

showPost(context, img) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
            child: ClipRRect(child: Image.asset(img, height: 300, width: 300)));
      });
}
