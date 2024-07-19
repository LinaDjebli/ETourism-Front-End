import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tro/Authentification/loginOrsignup.dart';
import 'package:tro/Authentification/signin.dart';
import 'package:tro/Componants/Passwordfield.dart';
import 'package:tro/Componants/textfiled.dart';
import 'package:tro/constants/Size.dart';
import 'package:tro/navigateur.dart';
import 'package:tro/screens2/main_screen.dart';
import 'package:tro/services/Authservice.dart';
 

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isselected = false;
  TextEditingController phonecntrlr = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  bool _isPasswordValid = true;
  bool visibleIcon = true;
  Icon passwordIcon = Icon(Icons.visibility_off);
  bool _isEmailValid = true;
  String passworderror =  '8 characters including number and special char';

String emailerror = 'Enter a valid email address' ; 
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => loginOrsignup()),
              );
            },
          ),
          title: const Text('Login'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "Phone"),
              Tab(text: "Email/password"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Form(
              key: _formKey1,
              child: Column(
                children: [
                  gapH32,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: IntlPhoneField(
                      controller: phonecntrlr,
                      cursorColor: Color.fromARGB(255, 0, 0, 0),
                      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        fillColor: Color.fromARGB(255, 0, 0, 0),
                        labelText: "Phone number",
                        border: OutlineInputBorder(borderSide: BorderSide()),
                      ),
                    ),
                  ),
                  gapH12,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: sigin(
                      onTap: siginmethod,
                      btntext: "Get code",
                    ),
                  )
                ],
              ),
            ),
            Form(
               key: _formKey2,
              child: Column(
                children: [
                  gapH32,
                  SizedBox(
                    width: 310,
                    child: TextFormField(
                      cursorColor: Colors.black,
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        errorText: _isEmailValid ? null :emailerror ,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.0,
                          ),
                        ),
                        labelStyle: TextStyle(color: Colors.black),
                        fillColor: Color.fromARGB(255, 165, 165, 165),
                      ),
                      onChanged: _validateEmail,
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: 310,
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: visibleIcon,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        errorText: _isPasswordValid ? null :passworderror,
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          color: Colors.black,
                          onPressed: () {
                            setState(() {
                              visibleIcon = !visibleIcon;
                              passwordIcon = visibleIcon
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility);
                            });
                          },
                          icon: passwordIcon,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.0,
                          ),
                        ),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      onChanged: _validatePassword,
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: sigin(
                      onTap:()=>{
                        setState(() {
                            _login();
                            
                        }),
                      
                      },
                      btntext: "Login",
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void siginmethod() {}

  void _validateEmail(String value) {
    setState(() {
      _isEmailValid = EmailValidator.validate(value);
    });
  }

  bool _isStrongPassword(String value) {
    return value.length >= 8 &&
        RegExp(r'[a-z]').hasMatch(value) &&
        RegExp(r'[0-9]').hasMatch(value) &&
        RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);
  }

  void _validatePassword(String value) {
    setState(() {
      _isPasswordValid = _isStrongPassword(value);
    });
  }

 void _login() async {
  if (_formKey2.currentState!.validate()) {
    final response = await _apiService.authenticateUser(
      emailController.text,
      _passwordController.text,
    );
     var responseData = jsonDecode(response.body);
      bool isGuide = responseData['is_guide'];
      bool isAgency = responseData['is_agency'];
      bool isClient = responseData['is_client'];

try { if (response.statusCode == 201) {
     
      if (isGuide || isAgency) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeWrapper2(),
          ),
        );
      } else if (isClient) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeWrapper(),
          ),
        );
      }
    } else if (response.statusCode == 406) {
      setState(() {
        _isPasswordValid = false;
        passworderror = "wrong password";
      });
    } else if (response.statusCode == 404) {
      setState(() {
        _isEmailValid = false;
        emailerror = "email not found";
      });
    } else if (response.statusCode == 405) {
      setState(() {
        _isPasswordValid = false;
        passworderror = "please fill in the form";
        _isEmailValid = false;
        emailerror = "please fill in the form";
      });
    }}catch(e){}
   
  }
}

 final ApiService _apiService = ApiService();
}
