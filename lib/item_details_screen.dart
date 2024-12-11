import 'package:flutter/material.dart';
import 'package:lost_and_found_project/item.dart';

class ItemDetailsScreen extends StatelessWidget {
  final Item item; //need to import item.dart to use Item reference

  const ItemDetailsScreen(this.item, {super.key}); //putting item as parameter to get selected item on home_screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Item Details" ,  style: TextStyle(fontFamily: "SourGummy"),),
          centerTitle: true,
          backgroundColor: Colors.white,),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child:Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  if(item.getImage()!=null)
                    Image.file(item.getImage()!, height: 200),


                  const Text(
                    "Item name:",
                    style: TextStyle(fontFamily: "SourGummy",
                        fontSize: 35,
                        color: Colors.redAccent),
                  ),
                  Text(
                    item.getItemName(), textAlign: TextAlign.center, //center's the text horizontally within its container
                    style: const TextStyle(fontFamily: "SourGummy", fontSize: 25),
                  ),
                  const Text(
                    "Description:",
                    style: TextStyle(fontFamily: "SourGummy",
                        fontSize: 35,
                        color: Colors.redAccent),
                  ),
                  Text(item.getDescription(), textAlign: TextAlign.center, //center's the text horizontally within its container
                    style: const TextStyle(fontFamily: "SourGummy", fontSize: 25),),
                  const Text(
                    "Status:",
                    style: TextStyle(fontFamily: "SourGummy",
                        fontSize: 35,
                        color: Colors.redAccent),
                  ),
                  Text(
                    item.getStatus(), textAlign: TextAlign.center, //center's the text horizontally within its container
                    style: const TextStyle(fontFamily: "SourGummy", fontSize: 25),
                  ),
                  const Text(
                    "Post Date:",
                    style: TextStyle(fontFamily: "SourGummy",
                        fontSize: 35,
                        color: Colors.redAccent),
                  ),
                  Text(
                    item.getDate(), textAlign: TextAlign.center, //center's the text horizontally within its container
                    style: const TextStyle(fontFamily: "SourGummy", fontSize: 25),
                  ),
                ],
              ),
            )
        ));
  }
}

