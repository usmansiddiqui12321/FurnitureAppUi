import 'package:flutter/material.dart';
import 'package:furniture_app_ui/Pages/favorite.dart';
import 'package:furniture_app_ui/Pages/homepage.dart';
import 'package:furniture_app_ui/Pages/notifications.dart';
import 'package:furniture_app_ui/Pages/profile.dart';

class MasterPage extends StatefulWidget {
  const MasterPage({Key? key}) : super(key: key);

  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  int _selectedIndex = 0; // To keep track of the selected tab

  // Define the pages you want to display for each tab.
  final List<Widget> _pages = [
    // Add your page widgets here.
    const Homepage(), const Favorites(), const Notifications(), const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page.
      bottomNavigationBar: BottomAppBar(
        shape:
            const CircularNotchedRectangle(), // This is for a rounded app bar.
        child: Container(
          height: size.height * 0.092364,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x0C000000),
                blurRadius: 50,
                offset: Offset(0, -2),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                iconSize: 24,
                icon: _selectedIndex == 0
                    ? const Icon(Icons.home)
                    : const Icon(
                        Icons.home_outlined,
                        color: Colors.grey,
                      ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
              ),
              IconButton(
                iconSize: 24,
                icon: _selectedIndex == 1
                    ? const Icon(Icons.bookmark)
                    : const Icon(Icons.bookmark_outline, color: Colors.grey),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
              ),
              IconButton(
                iconSize: 24,
                icon: _selectedIndex == 2
                    ? const Icon(Icons.notifications)
                    : const Icon(Icons.notifications_outlined,
                        color: Colors.grey),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
              ),
              IconButton(
                iconSize: 24,
                icon: _selectedIndex == 3
                    ? const Icon(Icons.person)
                    : const Icon(Icons.person_outlined, color: Colors.grey),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
