import 'package:flutter/material.dart';
import 'appbartool.dart';
import 'bottomBarTool.dart';

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const HomePage({
    Key? key,
    required this.isDarkMode,
    required this.onThemeToggle,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTool(
        isDarkMode: widget.isDarkMode,
        onThemeToggle: widget.onThemeToggle,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const Text(
        'Trouvez le repas que vous cherchez',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 16),
          // barre de recherche
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Recherche',
                prefixIcon: const Icon(Icons.search),
                border: InputBorder.none,
                fillColor: Colors.grey
              ),
            ),
          ),
          const SizedBox(height: 16),


        ]),
      bottomNavigationBar: BottomBarTool(
        currentIndex: currentIndex,
        onTabSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
