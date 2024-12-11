import 'package:flutter/material.dart';
import 'package:lost_and_found_project/login_screen.dart';
import 'package:lost_and_found_project/user.dart';

class SignUpScreen extends StatefulWidget{

  List<User> userList;

  SignUpScreen(this.userList , {super.key}); //the userList from the loginScreen gonna be assigned to userList in this class
                                            //and we can use it in signUpScreen for adding signed user to userList

  @override
  State<SignUpScreen> createState() {

    return _SignUpScreenState();
  }

}

class _SignUpScreenState  extends State<SignUpScreen>{

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _contactNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void signUp(){

      if(_fullNameController.text.isEmpty || _contactNumberController.text.isEmpty || _emailController.text.isEmpty || _passwordController.text.isEmpty ){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Notification"),
              content: const Text("You must fill all fields before signing up."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Dismiss the dialog
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      }else{  //if all fields are filled adding new user to userList and navigating to the login screen
        User user = new User(_fullNameController.text, _contactNumberController.text, _emailController.text, _passwordController.text);
        widget.userList.add(user); //adding signed user to userList which is came from the loginScreen

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(widget.userList),
          ),
        );
      }

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Signup" , style: TextStyle(fontWeight: FontWeight.bold , fontFamily: "SourGummy"),), centerTitle: true,),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

             TextField(
              controller: _fullNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Full name" ,
              ),
              style: const TextStyle(fontFamily: "SourGummy" ,),
            ),

            const SizedBox(height: 10,),

            TextField(
              controller: _contactNumberController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Contact number" ,
              ),
              style: const TextStyle(fontFamily: "SourGummy" ,),
            ),

            const SizedBox(height: 10,),

             TextField(
               controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Email" ,
              ),
              style: const TextStyle(fontFamily: "SourGummy" ,),
            ),

            const SizedBox(height: 10,),

            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Password" ,
              ),
              style: const TextStyle(fontFamily: "SourGummy" ,),
            ),

            const SizedBox(height: 15,),

            TextButton.icon(
              onPressed: signUp,
              style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.black, width: 3),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  textStyle: const TextStyle(fontSize: 22 , fontWeight: FontWeight.bold)),
              icon: const Icon(Icons.assignment_outlined , color: Colors.black),
              label: const Text("Signup" , style: TextStyle(fontFamily: "SourGummy"),),),
          ],
        ),
      ),
    );
  }

}