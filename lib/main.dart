import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:recipe/dashboard_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'afganiMutton.dart';
import 'createAccount.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  static const String validUsername = '';
  static const String validPassword = '';

  void authenticate(BuildContext context) {
    final String username = usernameController.text;
    final String password = passwordController.text;

    if (username == validUsername && password == validPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid username or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/loginimage.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 150, left: 25, right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 400,
                  height: 370,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color.fromARGB(255, 229, 232, 235),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 35,fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Text("Sign into Continue",style: GoogleFonts.poppins(textStyle:TextStyle(fontWeight: FontWeight.w400))),
                      //SizedBox(height: 10.0),
                      Padding(padding: EdgeInsets.all(20),child: 
                      TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 12.0),
                          icon: Icon(
                            Icons.mail,
                            color: Color.fromARGB(253, 0, 0, 0),
                          ),
                          labelText: 'username',
                          filled: false,
                          fillColor: Color.fromARGB(255, 255, 255, 255).withOpacity(1),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      ),
                      //SizedBox(height: 5.0),
                      Padding(padding: EdgeInsets.all(20),child: 
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          contentPadding:
                            EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
                          icon: Icon(
                            Icons.lock,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                          labelText: 'password',
                          filled: false,
                          fillColor: Colors.white.withOpacity(1),
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                      ),
                      ),
                      //SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () => authenticate(context),
                        child: Text('LOGIN'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color.fromARGB(255, 0, 0, 0),
                            foregroundColor: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Implement forgot password functionality
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AfganiMutton()));
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Implement create account functionality
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) => SignUp()));
                        },
                        child: Text(
                            'Create new Account',
                            style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}