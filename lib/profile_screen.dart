/*import 'package:flutter/material.dart';

import 'home_screen.dart';

class ProfileScreen extends StatelessWidget{

  const ProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Profile" , style: TextStyle(fontFamily: "SourGummy"),)),
      ),
      bottomNavigationBar: BottomNavigationBar(  //created bottom navigation bar for going to home and profile screens
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
              break;
          }
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),

      body: Text("PROFILE SCREEN LETSGOO"),
    );
  }

}

 */