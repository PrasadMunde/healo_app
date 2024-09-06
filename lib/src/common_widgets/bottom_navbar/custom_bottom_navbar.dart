import 'package:flutter/material.dart';
import 'package:healo_app/src/constants/text_strings.dart';
import 'package:healo_app/src/features/screens/abha_features/abha_card_create/abha_card_create.dart';
import 'package:healo_app/src/features/screens/dashboard/dashboard.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:healo_app/src/features/screens/profile/profile_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  void _navigateToScreen(BuildContext context, int index) {
    Widget screen;
    switch (index) {
      case 0:
        screen =  Dashboard(); // Replace with your actual HomeScreen widget
        break;
      case 1:
        screen = AbhaCardCreate() ; // Replace with your actual AbhaScreen widget
        break;
      case 2:
        screen =  Dashboard(); // Replace with your actual RecordsScreen widget
        break;
      case 3:
        screen = const ProfileScreen(); // Replace with your actual ProfileScreen widget
        break;
      default:
        screen =  Dashboard(); // Fallback to HomeScreen
    }

    // Navigate to the selected screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) {
        onItemTapped(index);
        _navigateToScreen(context, index);
      },
      selectedFontSize: 12,
      unselectedFontSize: 12,
      selectedIconTheme: IconThemeData(color: Colors.amberAccent, size: 30),
      unselectedIconTheme: IconThemeData(color: Colors.grey, size: 25),
      selectedItemColor: Colors.amberAccent,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: tHome,
        ),
        BottomNavigationBarItem(
          icon: Icon(LineAwesomeIcons.alternate_identification_card),
          label: tAbha,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.file_open_rounded),
          label: tRecords,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline_rounded),
          label: tProfile,
        ),
      ],
    );
  }
}
