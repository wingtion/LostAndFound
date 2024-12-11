import 'package:flutter/material.dart';
import 'package:lost_and_found_project/item.dart';
import 'package:lost_and_found_project/item_details_screen.dart';
import 'package:lost_and_found_project/login_screen.dart';
import 'package:lost_and_found_project/post_item_screen.dart';
import 'package:lost_and_found_project/profile_screen.dart';
import 'User.dart';

class HomeScreen extends StatefulWidget {

  //required for named parameter
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {

  List<Item> items = [
    Item("Red Backpack" , "Found close to cafeteria, Given to security." , "Found" , "21-03-2024"),
    Item("White Airpods" , "Lost in changing room.(Contact Info: 05478965472)" , "Lost" , "14-11-2024"),

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Lost and Found" , style: TextStyle(fontFamily: "SourGummy"),)),

      ),

      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            child: ListTile(
              title: Text(item.getItemName() , style: const TextStyle(fontFamily: "SourGummy" , fontWeight: FontWeight.bold),),
              subtitle: Text(item.getDescription()),
              trailing: Text(item.getStatus() , style: const TextStyle(fontFamily: "SourGummy" , fontWeight: FontWeight.bold, fontSize: 15),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemDetailsScreen(item), //I gave selected item to constructor to use selected item on
                                                                   //item details screen
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(  //using floating action button for adding posts
        onPressed: () async {
          final newItem = await Navigator.push(  //it waits for the result returned from post_item_screen
            context,
            MaterialPageRoute(
              builder: (context) => const PostItemScreen(),
            ),
          );

          if (newItem != null) {
            setState(() {
              items.add(newItem); // adding the item that came from the post item screen , to items list
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
