import 'package:flutter/material.dart';

import 'nav_pages/home_page.dart';
import 'nav_pages/crmpage_data.dart';
import 'nav_pages/setting_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}
class _DashboardPageState extends State<DashboardPage> {

  List<Widget> mNavPages = [
    HomePage(),
    CrmpageData(),
    SettingPage(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DashBoard Page"),
      ),
      body: mNavPages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.explore), label: "explore"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
          ],
      selectedItemColor: Colors.blue,
        currentIndex: selectedIndex,
        onTap: (value){
        selectedIndex = value;
        setState(() {});
        },

      ),

    );
  }
}
