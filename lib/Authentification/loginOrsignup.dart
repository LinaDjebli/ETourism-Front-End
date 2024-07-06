import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tro/Authentification/LOginChoice.dart';
import 'package:tro/Authentification/login.dart';
import 'package:tro/Componants/SquaretTile.dart';
import 'package:tro/Componants/Passwordfield.dart';
import 'package:tro/Authentification/Signup.dart';
import 'package:tro/Authentification/signin.dart';
import 'package:tro/Componants/textfiled.dart';
import 'package:tro/constants/Size.dart';
import 'package:tro/navigateur.dart';

double radius = 10.0;

class loginOrsignup extends StatefulWidget {
  loginOrsignup({super.key});

  @override
  State<loginOrsignup> createState() => _loginOrsignupState();
}

class _loginOrsignupState extends State<loginOrsignup> {
  //controller for text
  final usernamecontroller = TextEditingController();

 final  pwdcntrl = TextEditingController();
 bool isSelected = false;

  // sigin methode
  void SgininMethod() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        shadowColor: Color.fromARGB(255, 0, 0, 0),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>   HomeWrapper()),);
          },
        ),
      ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Center(
                    child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            //logo
  

            //welcome back message
            Text(
              'Login To ZorDzair',
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 32,
                fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(
              height: 4,
            ),
            SizedBox(
             width: 350,
                 child: Text(
                  'Manage your account , Check notification , book tours , explore Algeria , and more. ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                               ),
               ),
            const SizedBox(height: 50),



           Column(children: [

                SizedBox(
                  width: 340,
                  height: 60,
                  child: GestureDetector(
                    onTap: () {
                       Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  Login()),
                          );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: 
                                Color.fromARGB(255, 218, 218, 218), // Change border color when selected
                            width: 2), // Increase border width when selected
                       
                        
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          gapW12,
                          Icon(Icons.person),
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            " Use phone/email/username ",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                          )

                          
                        ],
                      ),
                    ),
                  ),
                ),
             gapH16,
              SizedBox(
                  width: 340,
                  height: 60,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected = true;
                       
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:  // Change color when selected
                            Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: 
                               Color.fromARGB(255, 218, 218, 218), // Change border color when selected
                            width: 2), // Increase border width when selected
                       
                        
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //gapW12,
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Image.asset(
                              "lib/photos/kisspng-computer-icons-google-pay-send-google-5b2c7faaee9f23.0947772515296429229774-removebg-preview.png",
                              height: 50,
                              width: 40,
                            )),
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            " continue with Google ",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                gapH16,
                 SizedBox(
                  width: 340,
                  height: 60,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected = true;
                       
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:  
                             Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: 
                                 Color.fromARGB(255, 218, 218, 218), // Change border color when selected
                            width: 2), // Increase border width when selected
                       
                        
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          gapW12,
                          Icon(Icons.apple),
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            " Continue with Apple ",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
          ],),
            //username textfield
           /* textfiled(
              controller: usernamecontroller,
              hintext: 'Enter your Email or Username ',
              obscuretext: false,
            ),

            const SizedBox(height: 20),

            //password textfield

            PasswordField(passwordcntr: pwdcntrl),

            const SizedBox(height: 10),
            // forgot password button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'forgot password ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),
            // sign in button
            sigin(
              onTap: SgininMethod,
              btntext: "Log in ",
            ),
            const SizedBox(height: 25),
            //continue with
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Text(
                      'Or continue with ',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ))
                  ],
                )),

            const SizedBox(
              height: 25,
            ),*/

           gapH64,
           gapH64,
             SizedBox(
             width: 350,
                 child: Text(
                  ' by continuing with an account locatedd in Algeria , you are agreeing to our Terms of Service and acknowledge that you have read the Privacy Policy ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                               ),
               ),
            //regester now
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dont have an account ?",
                  style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginChoice()),
                      );
                    },
                    child: Text(
                      "Regester now ",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        )))));
  }
}

/*import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class loginOrsignup extends StatefulWidget {
  @override
  _loginOrsignupState createState() => _loginOrsignupState();
}

class _loginOrsignupState extends State<loginOrsignup> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final String? idToken = googleAuth.idToken;

        final response = await http.post(
          Uri.parse('http://127.0.0.1:8000/api/google-login/'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(<String, String>{
            'id_token': idToken!,
          }),
        );

        if (response.statusCode == 200) {
          final Map<String, dynamic> data = jsonDecode(response.body);
          String suggestedName = data['suggested_name'];
          print('Suggested Name: $suggestedName');
          // Use the suggested name or navigate to the next screen
        } else {
          print('Failed to sign in');
        }
      }
    } catch (error) {
      print('Error signing in with Google: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login or Signup'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _handleGoogleSignIn,
          child: Text('Sign in with Google'),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: loginOrsignup()));*/
