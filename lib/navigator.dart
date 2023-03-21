import 'package:flutter/material.dart';
import 'package:posttest2_068_rahmayanti/main.dart';

class NavigatorWidget extends StatefulWidget {
  const NavigatorWidget({super.key});

  @override
  State<NavigatorWidget> createState() => _NavigatorWidgetState();
}

class _NavigatorWidgetState extends State<NavigatorWidget> {
  int _selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    const List<Widget> _allpages = [
      MainPage(),
      InfoUser(),
    ];

    void onItemtap(int index) {
      setState(() {
        _selectedindex = index;
      });
    }

    return Scaffold(
      body: _allpages.elementAt(_selectedindex),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle:
            const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 27,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                size: 27,
              ),
              label: "Profile"),
        ],
        currentIndex: _selectedindex,
        onTap: onItemtap,
      ),
    );
  }
}
