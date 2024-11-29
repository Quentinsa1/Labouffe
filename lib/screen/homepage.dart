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

  final List<Map<String, dynamic>> items = [
    {
      'image': 'data:image/jpeg;base64,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',
      'name': 'pistache',
      'price': '5000 FCFA',
    },
    {
      'image': 'https://www.google.com/imgres?q=Image%20de%20nourriture%20camerounaise&imgurl=https%3A%2F%2Fprod.cdn-medias.jeuneafrique.com%2Fcdn-cgi%2Fimage%2Fq%3Dauto%2Cf%3Dauto%2Cmetadata%3Dnone%2Cwidth%3D1215%2Cfit%3Dcover%2Fhttps%3A%2F%2Fprod.cdn-medias.jeuneafrique.com%2Fmedias%2F2020%2F12%2F23%2Fjad20201223-ass-cuisine-ndole.jpg&imgrefurl=https%3A%2F%2Fwww.jeuneafrique.com%2F1097405%2Fculture%2Fserie-le-ndole-lemblematique-plat-royal-camerounais-4-5%2F&docid=scbBUacx21cN8M&tbnid=BgNBYaYJQiiiQM&vet=12ahUKEwjS2__-kYKKAxVTW0EAHaTzE4IQM3oECHoQAA..i&w=1215&h=852&hcb=2&ved=2ahUKEwjS2__-kYKKAxVTW0EAHaTzE4IQM3oECHoQAA',
      'name': 'ndole',
      'price': '7000',
    },
    {
      'image': 'https://www.google.com/imgres?q=Image%20de%20nourriture%20camerounaise&imgurl=https%3A%2F%2Flookaside.fbsbx.com%2Flookaside%2Fcrawler%2Fmedia%2F%3Fmedia_id%3D2712520982393660&imgrefurl=https%3A%2F%2Fwww.facebook.com%2FTourismoCameroun%2Fposts%2Fla-cuisine-camerounaise-lexpression-de-la-diversite-et-de-la-richesse-culturelle%2F2712522389060186%2F&docid=IgE4jj1OAUAngM&tbnid=gnS-8cjS2XgsLM&vet=12ahUKEwjS2__-kYKKAxVTW0EAHaTzE4IQM3oECDYQAA..i&w=640&h=640&hcb=2&ved=2ahUKEwjS2__-kYKKAxVTW0EAHaTzE4IQM3oECDYQAA',
      'name': 'sanga',
      'price': '4000',
    },
  ];


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
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(

                onPressed: () {
                },
                child: const Text('Africains'),
              ),
              ElevatedButton(
                onPressed: () {
                },
                child: const Text('Européens'),
              ),
              ElevatedButton(
                onPressed: () {
                },
                child: const Text('Asiatiques'),
              ),
            ],
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
