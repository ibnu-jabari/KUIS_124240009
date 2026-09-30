import 'package:flutter/material.dart';

import 'screen/home.dart';
import 'screen/profile.dart';

class Root extends StatefulWidget {
  final String username; // Menerima data username dari LoginPage
  const Root({super.key, required this.username});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomePage(),
      ProfilePage(username: widget.username),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 161, 63),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Pokemon App'),
      ),
      // IndexedStack menjaga state tiap halaman, jadi gambar profil yang
      // sudah dipilih tidak kereset saat pindah tab Home <-> Profile.
      body: IndexedStack(index: _selectedIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal, // Warna tab yang sedang aktif
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // Ganti halaman saat tab ditekan
          });
        },
        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}