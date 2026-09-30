import 'package:flutter/material.dart';

import 'login.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  const ProfilePage({super.key, required this.username});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static const String _maleImage =
      'https://archives.bulbagarden.net/media/upload/1/1f/Sword_Shield_Victor.png';
  static const String _femaleImage =
      'https://archives.bulbagarden.net/media/upload/c/cd/Sword_Shield_Gloria.png';

  // Foto profil default = Male (Victor).
  String _selectedImage = _maleImage;

  void _gantiGambar(String url) {
    setState(() {
      _selectedImage = url;
    });
  }

  void _logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false,
    );
  }

  Widget _networkImage(
    String url, {
    BoxFit fit = BoxFit.contain,
    Alignment alignment = Alignment.center,
  }) {
    return Image.network(
      url,
      fit: fit,
      alignment: alignment,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return const Center(child: CircularProgressIndicator(strokeWidth: 2));
      },
      errorBuilder: (context, error, stackTrace) =>
          const Icon(Icons.person, color: Colors.grey),
    );
  }

  // Tombol bergambar: GestureDetector membungkus lingkaran berisi gambar.
  Widget _imageButton(String url, Color color) {
    final isSelected = _selectedImage == url;

    return GestureDetector(
      onTap: () => _gantiGambar(url),
      child: Container(
        width: 46,
        height: 46,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? Colors.black87 : Colors.transparent,
            width: 2,
          ),
        ),
        child: ClipOval(
          child: _networkImage(
            url,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Foto profil
            Container(
              width: 140,
              height: 140,
              decoration: const BoxDecoration(
                color: Color(0xFFE8DEF8),
                shape: BoxShape.circle,
              ),
              child: ClipOval(child: _networkImage(_selectedImage)),
            ),
            const SizedBox(height: 12),
            // Username yang sedang login
            Text(
              widget.username,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            // 2 tombol bergambar: Male & Female
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _imageButton(_maleImage, Colors.blue),
                _imageButton(_femaleImage, Colors.pink),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Saya bersumpah mengerjakan soal kuis ini dengan cara yang jujur dan tidak curang dengan cara apapun',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _logout,
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}