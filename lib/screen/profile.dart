import 'package:flutter/material.dart';
import 'login.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  const ProfilePage({super.key, required this.username});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;
  final List<Color> colors = [
    Colors.green, Colors.blue,  Colors.red, Colors.purple,
  ];

  void gantiWarna(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 111,
            backgroundColor: colors[_selectedIndex],
            child: Icon(Icons.person, size: 111, color: Colors.white),
          ),
          SizedBox(height: 11),
          Text(
            widget.username,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 11),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Saya bersumpah mengerjakan soal kuis ini dengan jujur dan tidak melakukan kecurangan apapun itu',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 11),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  gantiWarna(1);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors[1],
                ),
                child: const Text(''),
              ),
              SizedBox(width: 11),
              ElevatedButton(
                onPressed: () {
                  gantiWarna(2);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors[2],
                ),
                child: const Text(''),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  gantiWarna(3);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors[3],
                ),
                child: const Text(''),
              ),
            ],
          ),
          SizedBox(height: 11),

          ElevatedButton(
            onPressed: logout,
            style: ElevatedButton.styleFrom(
              backgroundColor: colors[_selectedIndex],
            ),
            child: Text(
              'logout',
            ),
          ),
        ],
      ),
    );
  }
}