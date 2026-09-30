class User {
  String username;
  String password;
  String name;
  String image; 

  User({
    required this.username,
    required this.password,
    required this.name,
    required this.image,
  });
}

List<User> users = [
  User(
    username: 'Ibnu_Jabari',
    password: 'AkuRaja',
    name: 'IBNU JABARI',
    image: 'https://archives.bulbagarden.net/media/upload/1/1f/Sword_Shield_Victor.png'
  ),
];