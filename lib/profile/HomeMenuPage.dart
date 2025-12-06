import 'package:flutter/material.dart';
import 'ProfileHomePage.dart';

class HomeMenuPage extends StatelessWidget {
  const HomeMenuPage({super.key});
  static const Color couleur= Colors.white;
  static const String nom_pers="Fama COUNDOUL";
  static const String titre_prof="UX/UI Designer";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Home Page",
          style: TextStyle(color: couleur),
        ),
        centerTitle: false,
        backgroundColor: Color(0xFFB04BFF),
        elevation: 8,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ------------------- HEADER -------------------
          SizedBox(
            height: 360,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // --- MENU HAMBURGER ---
                Positioned(
                  top: 50,
                  left: 20,
                  child: IconButton(
                    icon: const Icon(Icons.menu, color: Colors.black87, size: 28),
                    onPressed: () {},
                  ),
                ),

                // --- PROFILE PHOTO ---
                Positioned(
                  top: 80,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: CircleAvatar(
                      radius: 58,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 55,
                        backgroundImage: const NetworkImage("https://png.pngtree.com/thumb_back/fh260/background/20240522/pngtree-abstract-cloudy-background-beautiful-natural-streaks-of-sky-and-clouds-red-image_15684333.jpg"),
                      ),
                    ),
                  ),
                ),

                // --- NAME ---
                Positioned(
                  top: 205,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Column(
                      children: [
                        const Text(
                          nom_pers,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          titre_prof,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // --- WAVE SHAPE ---
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      height: 85,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF7B2FFF), Color(0xFFB04BFF)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ------------------- MENU LIST -------------------
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              children: [
                _menuItem(
                  icon: Icons.person_outline,
                  text: "My Profile",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ProfileHomepage()),
                    );
                  },
                ),
                _menuItem(
                  icon: Icons.mail_outline,
                  text: "Messages",
                  trailing: _notifBadge(7),
                ),
                _menuItem(
                  icon: Icons.favorite_border,
                  text: "Favourites",
                ),
                _menuItem(
                  icon: Icons.location_on_outlined,
                  text: "Location",
                ),
                _menuItem(
                  icon: Icons.settings_outlined,
                  text: "Settings",
                ),
                const SizedBox(height: 40),
                Center(
                  child: Column(
                    children: [
                      const Icon(Icons.logout, color: Colors.grey),
                      const SizedBox(height: 5),
                      const Text(
                        "Logout",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------- Menu item widget ----------
  Widget _menuItem({
    required IconData icon,
    required String text,
    VoidCallback? onTap,
    Widget? trailing,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Row(
          children: [
            Icon(icon, color: Colors.black87),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),
            if (trailing != null) trailing,
          ],
        ),
      ),
    );
  }

  // ---------- Notification badge ----------
  Widget _notifBadge(int number) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Color(0xFFB04BFF),
        shape: BoxShape.circle,
      ),
      child: Text(
        "$number",
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// --------------------------------------------------
// ------------------ WAVE CLIPPER ------------------
// --------------------------------------------------
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Commence en haut à gauche
    path.moveTo(0, 0);

    // Ligne droite vers le haut droit
    path.lineTo(size.width, 0);

    // Ligne droite vers le début de la vague à droite
    path.lineTo(size.width, size.height - 30);

    // DEUXIÈME COURBE (de droite vers le centre - remonte puis descend)
    path.quadraticBezierTo(
      size.width * 0.75,    // point de contrôle X
      size.height - 70,     // point de contrôle Y (remonte)
      size.width * 0.5,     // point final X
      size.height - 40,     // point final Y (descend)
    );

    // PREMIÈRE COURBE (du centre vers la gauche - remonte puis descend)
    path.quadraticBezierTo(
      size.width * 0.25,    // point de contrôle X
      size.height - 10,     // point de contrôle Y (remonte)
      0,                    // point final X
      size.height - 50,     // point final Y (descend)
    );

    // Ferme le chemin en revenant au début
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}