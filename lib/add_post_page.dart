import 'package:coded_social_media/models/users.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  int currentIndex = 2;

  var selectedImage;
  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController captionController = TextEditingController();

    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      TextField(
          controller: usernameController,
          decoration: const InputDecoration(
              hintText: "Enter Username", labelText: "Username")),
      TextField(
          controller: captionController,
          decoration: const InputDecoration(
              hintText: "Enter Caption", labelText: "Caption")),
      ElevatedButton(
          child: const Text("Upload Photo"),
          onPressed: () {
            _pickImageFromGallery();
          }),
      selectedImage != null
          ? Image.network(selectedImage)
          : const Text("No Image Currently Chosen"),
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (usernameController.text.isNotEmpty &&
                      captionController.text.isNotEmpty &&
                      selectedImage.toString().isNotEmpty) {
                    Users.users.add(Users(
                        username: usernameController.text,
                        avatar: "",
                        caption: captionController.text,
                        liked: false,
                        post: selectedImage));
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Post Successful")));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please enter all required fields")));
                  }
                });
              },
              child: const Text("Post")))
    ])));
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;

    setState(() {
      selectedImage = returnedImage.path;
    });
  }
}
