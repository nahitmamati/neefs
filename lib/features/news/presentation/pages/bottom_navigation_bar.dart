import 'package:flutter/material.dart';
import 'package:neefs/features/news/presentation/pages/home_page.dart';
import 'package:neefs/features/profile/presentation/pages/profile_page.dart';

final pages = [HomePage(), HomePage(), ProfilePage()];
int index = 0;

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_num_outlined),
              activeIcon: Icon(Icons.confirmation_num),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: "",
            ),
          ],
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
        ),
        body: pages[index],
      ),
    );
  }
}
