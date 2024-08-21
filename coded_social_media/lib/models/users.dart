class Users {
  String username;
  String avatar;
  String post;
  String caption;
  bool liked;

  Users(
      {required this.username,
      required this.avatar,
      required this.caption,
      required this.liked,
      required this.post});

  static List<Users> users = [
    Users(
        username: "Hamad AlKhalaf",
        avatar: "images/avatars/hamad.jpg",
        caption: "ذكريات جميلة",
        liked: true,
        post: "images/post/hamadpost.jpg"),
    Users(
        username: "Lana Loai",
        avatar: "images/avatars/lana.jpg",
        caption: "راح أورجيه",
        liked: false,
        post: "images/post/lanapost.jpg"),
    Users(
        username: "Omar AlKandari",
        avatar: "images/avatars/omar.jpg",
        caption: "تيم خيالي",
        liked: true,
        post: "images/post/omarpost.jpg"),
    Users(
        username: "Ali AlFadhli",
        avatar: "images/avatars/Ali.png",
        caption: "يعطيج العافية رهف",
        liked: false,
        post: "images/post/alipost.png")
  ];
}
