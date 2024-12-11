import 'package:flutter/material.dart';
import 'package:lost_and_found_project/home_screen.dart';
import 'package:lost_and_found_project/signup_screen.dart';
import 'package:lost_and_found_project/user.dart';

class LoginScreen extends StatefulWidget{

  final List<User> userList;  //created userList variable and give it to constructor as parameter to be able to
                             //use the userList from the main.dart

  const LoginScreen(this.userList , {super.key}); //assigned the userList came from main.dart to our userList in this class


  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }


}

class _LoginScreenState extends State<LoginScreen>{

  //created controllers for reaching to the email and password in text fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  void login(){
    setState(() {
      for(int i=0 ; i<widget.userList.length ; i++){
        if(widget.userList[i].password == _passwordController.text && widget.userList[i].email == _emailController.text){
          _passwordController.text = "";
          _emailController.text = "";

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        }
      }
    });

  }
  void goToSignupScreen(){
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignUpScreen(widget.userList), //we gave userList as a argument to use it in SignUpScreen
                                                        //accordingly in SignUpScreen we added extra parameter to constructor
        ),
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login" , style: TextStyle(fontFamily: "SourGummy" , fontWeight: FontWeight.bold), ),
        centerTitle: true,
        automaticallyImplyLeading: false, // This disables the back button
      ),
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(child:Column(
            children: [
              Image.asset("assets/images/computer-security-with-login-password-padlock.jpg" , width: 250, height: 200,),

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

              const SizedBox(height: 10,),


              TextButton.icon(
                onPressed: login,
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.black, width: 3),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    textStyle: const TextStyle(fontSize: 22 , fontWeight: FontWeight.bold)),
                icon: const Icon(Icons.login , color: Colors.black),
                label: const Text("Login" , style: TextStyle(fontFamily: "SourGummy"),) ,),

              const SizedBox(height: 10,),

              TextButton.icon(
                onPressed: goToSignupScreen,
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.black, width: 3),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    textStyle: const TextStyle(fontSize: 22 , fontWeight: FontWeight.bold)),
                icon: const Icon(Icons.assignment_ind_outlined , color: Colors.black),
                label: const Text("Signup" , style: TextStyle(fontFamily: "SourGummy"),),),

            ],
          ),),
      ),
    );
  }
}