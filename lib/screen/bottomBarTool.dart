import 'package:flutter/material.dart';
import 'package:labouffe/screen/panier.dart'; 
import 'homepage.dart'; 
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

class BottomBarTool extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected; 

  const BottomBarTool({
    Key? key,
    required this.currentIndex,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  _BottomBarToolState createState() => _BottomBarToolState();
}

class _BottomBarToolState extends State<BottomBarTool> {
  // Fonction de bascule du thème
  void _toggleTheme() {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    themeProvider.toggleDarkMode(); // 
  }

  final List<Widget> _pages = [
    HomePage(isDarkMode: false, onThemeToggle: () {}),
    CartPage(),   
    //CommentsPage(), 
    //ProfilePage(), 
  ];

  @override
  Widget build(BuildContext context) {
    // On récupère le mode sombre de notre ThemeProvider
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return Scaffold(

      body: IndexedStack(
        index: widget.currentIndex,  // Affiche la page correspondant à l'index sélectionné
        children: _pages,      // Liste des pages
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.currentIndex,
        onTap: widget.onTabSelected,  // On passe le callback `onTabSelected`
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: widget.currentIndex == 0 ? Colors.blue : Colors.grey,
            ),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: widget.currentIndex == 1 ? Colors.blue : Colors.grey,
            ),
            label: 'Panier',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.comment,
              color: widget.currentIndex == 2 ? Colors.blue : Colors.grey,
            ),
            label: 'Commentaires',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: widget.currentIndex == 3 ? Colors.blue : Colors.grey,
            ),
            label: 'Profil',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

extension on ThemeProvider {
   get isDarkMode => null;

  void toggleDarkMode() {}
}
