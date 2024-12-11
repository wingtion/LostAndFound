import 'package:flutter/material.dart';
import 'package:lost_and_found_project/login_screen.dart';
import 'package:lost_and_found_project/user.dart';

void main() {

  List<User> userList = [
    User("Hasan Efe Dinç" , "05427896545" , "hasanefedinc@hotmail.com" , "hasan123"),
    User("Admin" , "05478992214" , "admin" , "admin")
  ];

  runApp(MaterialApp(home: LoginScreen(userList),),); //we sent userList as a argument to use it in LoginScreen
}


