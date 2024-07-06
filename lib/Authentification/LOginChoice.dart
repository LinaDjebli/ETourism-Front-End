import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tro/Authentification/AgencySignup.dart';
import 'package:tro/Authentification/GuideSignup.dart';
import 'package:tro/Authentification/Signup.dart';
import 'package:tro/Authentification/loginOrsignup.dart';
import 'package:tro/constants/Size.dart';

class LoginChoice extends StatelessWidget {
  const LoginChoice({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold( 
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 86, 139, 255),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>    loginOrsignup()),);
          },
        ),
      ),

        backgroundColor: Colors.white,
        body: SafeArea(
          child:  SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50),
                Text(
              'signup To ZorDzair',
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
                  'Choose an option below to sign up',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                               ),
               ),
                SizedBox(
                  height: 50,
                ),
                  
                          
                ChoiceBtn(
                  imagepath:
                      "lib/photos/travel-agent-abstract-concept-vector-illustration-2G4ME4R-removebg-preview.png",
                  text: " Signup as a Travel Agency ",
                  route: MaterialPageRoute(builder: (context) =>   AgencySignup()),
                ),
                 SizedBox(
                    width: 310,
                    child: Text("Manage your tours, reach a broader audience, and grow your business.",style: TextStyle(fontSize: 12,color: Colors.grey), )),
                SizedBox(
                  height: 25,
                ),
                ChoiceBtn(
                  imagepath:
                      "lib/photos/1dfb2f7cfb76190864e718c9ce0f759c-removebg-preview.png",
                  text: "Signup as a Guide ",
                  route: MaterialPageRoute(builder: (context) =>  GuideSignup()),
                ),
                 SizedBox(
                    width: 310,
                    child: Text("Offer your services, connect with travelers, and share your expertise.",style: TextStyle(fontSize: 12,color: Colors.grey), )),
                SizedBox(
                  height: 25,
                ),
                ChoiceBtn(
                  imagepath:
                      "lib/photos/Girl-Traveling-Illustration-1-removebg-preview.png",
                  text: 'Signup as a Client',
            
                  route: MaterialPageRoute(
                      builder: (context) =>
                           SignupPage(),
                             settings: RouteSettings(arguments: '/pageThree'),), // Corrected route builder
                ),
                 SizedBox(
                    width: 310,
                    child: Text("Explore Algeria, book tours, and enjoy personalized travel experiences.",style: TextStyle(fontSize: 12,color: Colors.grey), )),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Have an account  ? ",
                      style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => loginOrsignup()),
                          );
                        },
                        child: Text(
                          "Log in  ",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold , fontSize: 16),
                        ))
                  ],
                ),
                gapH16,
              ],
            ),
          ),
        ));
  }
}

class ChoiceBtn extends StatefulWidget {
  final String imagepath;
  final String text;

  final Route route;

  const ChoiceBtn({
    Key? key,
    required this.imagepath,
    required this.text,
    required this.route,
  }) : super(key: key);

  @override
  _ChoiceBtnState createState() => _ChoiceBtnState();
}

class _ChoiceBtnState extends State<ChoiceBtn> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
          Navigator.of(context).push(widget.route);
        },
        child: Container(
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.blue // Change color when selected
                : Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: isSelected
                    ? Colors.blue
                    : const Color.fromARGB(255, 135, 133,
                        133), // Change border color when selected
                width: 2), // Increase border width when selected
            
          ),
          child: Row(
            children: [
              Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.asset(
                    widget.imagepath,
                    height: 100,
                  )),
              const SizedBox(
                width: 5,
              ),
              Text(
                widget.text,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
