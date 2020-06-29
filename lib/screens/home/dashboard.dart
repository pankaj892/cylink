import 'package:cylink/screens/knowledge/knowledge_shop.dart';
import 'package:cylink/screens/user/user_info_knowledge.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../components/my_flutter_app_icons.dart';
import '../chip/chip_information.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

// AnimatedWidget
class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  List screens = [
    UserKnowledge(),
    KnowledgeCenter(),
    ChipInformation(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(blurRadius: 20, color: Colors.white.withOpacity(.1))
            ]),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                    gap: 8,
                    activeColor: Colors.black,
                    iconSize: 24,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    duration: Duration(milliseconds: 800),
                    tabBackgroundColor: Colors.grey[800],
                    tabs: [
                      GButton(
                        icon: Icons.person,
                        text: 'User',
                      ),
                      GButton(
                        icon: MyFlutterApp.brain,
                        text: 'Knowledge',
                      ),
                      GButton(
                        icon: MyFlutterApp.microchip,
                        text: 'Chip',
                      ),
                    ],
                    selectedIndex: _selectedIndex,
                    onTabChange: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    }),
              ),
            )));
  }
}
