import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tro/Componants/List_Of_States.dart';
import 'package:tro/Componants/SquaretTile.dart';
import 'package:tro/Componants/textfiled.dart';
import 'package:tro/Authentification/LOginChoice.dart';
import 'package:tro/constants/Size.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tro/modules/agency.dart';
import 'package:tro/navigateur.dart';
import 'package:tro/services/Authservice.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AgencySignup extends StatefulWidget {
  AgencySignup({Key? key}) : super(key: key);

  @override
  State<AgencySignup> createState() => _AgencySignupState();
}

class _AgencySignupState extends State<AgencySignup> {
  File? _licenseFile;
  File? _profilePicture;
  final ImagePicker _picker = ImagePicker();
  List<bool> isSelected = [true, false, false];
  
  bool isSelectedFile = false;
  String errorName = "Fill in the form";
  String errorEmail = "Enter a valid email";
  String errorPassword = "8 characters including numbers and special char";
  String errorPhone = "Enter a valid phone number";
  String errorWebsite = "Enter a valid website";
  String errorLocation = "Enter a valid location";
  String errorLicense = "Insert your license";
  final _formKey = GlobalKey<FormState>();
  bool _isEmailValid = true;
  bool _isPhoneValid = true ; 
  bool  _ispasswordValide = true ; 
  bool _isWebSiteValide = true ; 
  bool isLicencesValide = true ; 
  bool isLocationValide = true ;
 
  void method() => {};
 // String? userSelected;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  TextEditingController _controller = TextEditingController();
  Uri filecontroller = Uri(); 
  int numberofemployyes = 0 ;
  bool visibleIconPassword = true;
  bool isNameValid = true;
  Icon passwordIcon = Icon(Icons.visibility_off);

// Store user information in SharedPreferences
Future<void> storeUserInfo(String name,  String email, String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('name', name);
  await prefs.setString('email', email);
await prefs.setString('auth_token', token);
  print('Stored token: ${prefs.getString('auth_token')}');
  print('Stored name: ${prefs.getString('name')}');
  print('Stored email: ${prefs.getString('email')}');
}

// Retrieve user information from SharedPreferences
Future<Map<String, String>> _getUserInfo() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String username = prefs.getString('username') ?? '';
  String email = prefs.getString('email') ?? '';
  String  token = prefs.getString('token') ?? '';
  return {'username': username, 'email': email, token :'token'};
}

   Future<void> _pickLicenseFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _licenseFile = File(result.files.single.path!);
        // filecontroller = _licenseFile!.uri;
         _controller.text = _licenseFile!.path;
         
      });
    }
  }

  Future<void> _pickProfilePicture() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profilePicture = File(pickedFile.path);
      });
    }
  }

  void _validateEmail(String value) {
    setState(() {
      _isEmailValid = EmailValidator.validate(value);
    });
  }

void _validatename(String value) {
  if(nameController.text.isNotEmpty){
    setState(() {
      isNameValid = true ; 
    });
  }
    
  }
  void _validatePhonenumber(String value) {
     if(phoneController.text.isNotEmpty){
    setState(() {
      _isPhoneValid = true ; 
    });
  }
  }
  void _validatePassword(String value) {
    setState(() {
      _ispasswordValide = _isStrongPassword(value);
    });
  }
bool _isStrongPassword(String value) {
    return value.length >= 8 &&
        RegExp(r'[a-z]').hasMatch(value) &&
        RegExp(r'[0-9]').hasMatch(value) &&
        RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);
  }

  void _validatewebsite(String value) {
    if( websiteController.text.isNotEmpty){
    setState(() {
       _isWebSiteValide = true ; 
    });
  }
  }
  void _validatelocation(String value) {
    if( locationController.text.isNotEmpty){
    setState(() {
        isLocationValide = true ; 
    });
  }
  }
  void _validatelicences (String value) {
     if( _controller.text.isNotEmpty){
    setState(() {
       isLicencesValide = true ; 
    });
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 80, 95, 221),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginChoice()),
            );
          },
        ),
        title: Text(""),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 252, 252),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
             key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 50),
                Row(
                  children: [
                    SizedBox(width: 30),
                    Text(
                      "Continue as an agency",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    SizedBox(width: 30),
                    Text(
                      "agency name",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                gapH12,
                _buildTextField(
                  controller: nameController,
                  hintText: "Agency name",
                  //labelText: "Enter agency name",
                  errorText: isNameValid ? null : errorName,
                  onChanged: _validatename
                ),
                 SizedBox(height: 25),
                Row(
                  children: [
                    SizedBox(width: 30),
                    Text(
                      "agency profetionnal ",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                _buildTextField(
                  controller: emailController,
                  hintText: "example@example.com",
                 // labelText: "Enter agency official email",
                  errorText: _isEmailValid ? null : errorEmail,
                  onChanged: _validateEmail,
                ),
                 SizedBox(height: 25),
                Row(
                  children: [
                    SizedBox(width: 30),
                    Text(
                      "create a password ",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                _buildTextField(
                  controller: passwordController,
                  hintText: "Password",
                 // labelText: "Create password",
                  obscureText: visibleIconPassword,
                  onChanged: _validatePassword,
                  errorText: _ispasswordValide? null: errorPassword ,
                  suffixIcon: IconButton(
                    color: Colors.black,
                    onPressed: () {
                      setState(() {
                        visibleIconPassword = !visibleIconPassword;
                        passwordIcon = visibleIconPassword
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility);
                      });
                    },
                    icon: passwordIcon,
                    
                  ),
                ),
                 SizedBox(height: 25),
                Row(
                  children: [
                    SizedBox(width: 30),
                    Text(
                      "phone number",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20),
                      child: IntlPhoneField(
                        initialCountryCode: 'DZ',
                        controller: phoneController,
                        cursorColor: Color.fromARGB(255, 0, 0, 0),
                        style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        decoration:  InputDecoration(
                          labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          fillColor: Color.fromARGB(255, 0, 0, 0),
                          labelText: "Phone number",
                          border: OutlineInputBorder(borderSide: BorderSide()),
                          errorText: _isPhoneValid? null :  errorPhone ,
                        ),
                      ),
                    ),
                 SizedBox(height: 25),
                Row(
                  children: [
                    SizedBox(width: 30),
                    Text(
                      "enter website",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                _buildTextField(
                  controller: websiteController,
                  hintText: "Website link",
                 // labelText: "Enter agency website link",
                  errorText: _isWebSiteValide? null :errorWebsite,
                  onChanged: _validatewebsite
                ),
                 SizedBox(height: 25),
                Row(
                  children: [
                    SizedBox(width: 30),
                    Text(
                      "agency location ",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                _buildTextField(
                  controller: locationController,
                  hintText: "location ",
                 // labelText: "Enter agency website link",
                  errorText: isLocationValide? null :errorLocation,
                  onChanged: _validatelocation
                ),
             
                 SizedBox(height: 25),
                Row(
                  children: [
                    SizedBox(width: 30),
                    Text(
                      "upload your agencie's licences ",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                  SizedBox(height: 25),
                _buildFilePicker(),
                SizedBox(height: 25),
                 SizedBox(height: 25),
               ElevatedButton(
                style: ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return Colors.blue[800]; // Darker shade when pressed
      }
      return Colors.blue; // Default color
    }),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 30, vertical: 20)), // Padding
    textStyle: MaterialStateProperty.all<TextStyle>(
      TextStyle(fontSize: 18), // Text size
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
    ),
  ),
    onPressed: () {
      if(nameController.text.isEmpty){
        setState(() {
           isNameValid = !isNameValid ; 
        });
       
      } if(emailController.text.isEmpty){
        setState(() {
           _isEmailValid= !_isEmailValid ; 
        });
       
      } if(passwordController.text.isEmpty){
        setState(() {
          _ispasswordValide  =  !_ispasswordValide; 
        });
          
      } if(phoneController.text.isEmpty){
        setState(() {
           _isPhoneValid =!_isPhoneValid;
        });
        
      } if (websiteController.text.isEmpty){
        setState(() {
          _isWebSiteValide = !_isWebSiteValide ; 
        });
            
      }if(locationController.text.isEmpty){
        setState(() {
             isLocationValide = !isLocationValide ; 
        });
        
      } if(_controller.text.isEmpty){
        setState(() {
           isLicencesValide = !isLicencesValide; 
        });
          
      }else{ _submit(context); }
       // Pass the context to _submit function
    },
    child: Text('Submit'),
    ),

    gapH18,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
     bool isFocused = false,
    required TextEditingController controller,
    required String hintText,
   // required String labelText,
    bool obscureText = false,
    String? errorText,
    void Function(String)? onChanged,
    Widget? suffixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        onTap: () {
          setState(() {
            isFocused = !isFocused;
          });
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
        //  labelText: labelText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isFocused ? Colors.black : Color.fromARGB(255, 184, 184, 184),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          fillColor: const Color.fromARGB(255, 255, 255, 255),
          filled: true,
          errorText: errorText,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }

 
  Widget _buildEmployeeToggle() {
    return Column(
     // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(width: 30),
            Text(
              'How many employees does your company have?',
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        ToggleButtons(
          disabledBorderColor: Colors.white,
          color: Colors.white,
          focusColor: Colors.white,
          selectedBorderColor: Colors.white,
          children: [
            
            togglebtn(
              text: "5-50 ",
              isSelected: isSelected[0],
            ),
            togglebtn(text: "50-100", isSelected: isSelected[1]),
            togglebtn(text: "100-500", isSelected: isSelected[2]),
          
          ],

          isSelected: isSelected,
          fillColor: Colors.white,
          borderColor: Colors.white,
          onPressed: (int index) {
            setState(() {
              for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                isSelected[buttonIndex] = (buttonIndex == index);
                for ( int i = 0 ; i < isSelected.length ; i++){
                  if(isSelected[i]){
                    numberofemployyes = i ; 
                  }
                }
              }
            });
          },
        ),

        
      ],
    );
  }
Widget _buildFilePicker() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: _pickLicenseFile,
            style: ElevatedButton.styleFrom(
              primary: Colors.blue, // Button color
              padding: EdgeInsets.symmetric(vertical: 12), // Increase button height
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Rounded corners
              ),
              textStyle: TextStyle(
                fontSize: 18, // Increase font size
                fontWeight: FontWeight.bold,
              ),
            ),
            child: Text(
              'Select a file',
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(height: 10), // Add some space between button and text
          TextField(
           // onChanged: _validatelicences,
          controller: _controller,
            
            readOnly: true,
            decoration: InputDecoration(
             //  errorText: isLicencesValide? null :"no file selected ",
             
              hintText: _controller.text.isEmpty ? "no file selected" : _controller.text,
              hintStyle: isLicencesValide? null : TextStyle(color: Colors.red),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 223, 222, 222),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 235, 234, 234),
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              fillColor: const Color.fromARGB(255, 255, 255, 255),
              filled: true,
            ),
          ),
        ],
      ),
    );
  }


  
  Future<void> _submit(BuildContext context) async {
   
 try {
   if(isSelected[0]){
     numberofemployyes = 50 ; 
    }else if(isSelected[1]){
    numberofemployyes = 100 ; 
    }else{
     numberofemployyes = 500 ; 
    }
 if (_licenseFile == null) {
    print('License file is null.');
    return;
  } 
    Agency agency = Agency(
      username:  nameController.text,
      agencyName: nameController.text,
      agencyEmail: emailController.text,
      password: passwordController.text,
      password2: passwordController.text,
      agencyPhoneNumber: phoneController.text,
      agencyWebsite: websiteController.text,
      numberOfEmployees:  numberofemployyes,
      agencyLocation: locationController.text,
      agencyLicenses: _licenseFile!,
      agencyProfilePicture: _profilePicture,
    );
    // Your existing code to prepare agency data and make the API call
    var response = await _apiService.registerAgency(agency);

    // Log response details for debugging
    print('Response status code: ${response?.statusCode}');
    print('Response body: ${response?.data}');
      
    // Handle different HTTP status codes
    if (response?.statusCode == 201) {
       String token = response?.data['access'];

     await storeUserInfo(nameController.text, emailController.text , token );
       Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeWrapper(), // Replace NewPage with your actual page widget
        ),
      );
    } else if (response?.statusCode == 400) {
      // Handle 400 Bad Request (e.g., duplicate email)
      setState(() {
        _isEmailValid = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email already in use'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      // Handle other HTTP status codes
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Signup failed with status code ${response?.statusCode}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  } catch (e) {
    // Handle Dio errors
    print('Dio error: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Failed to register. Please try again later.'),
        backgroundColor: Colors.red,
      ),
    );
  }
    
  }

 

   final ApiService _apiService = ApiService();
}




   
  void siginmethod() {}
 

class togglebtn extends StatelessWidget {
  final String text;
  final bool isSelected;
  togglebtn({super.key, required this.text, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
     padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : const Color.fromARGB(255, 163, 163, 163),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white),
        ),
        child: Row(
          children: [
            SizedBox(width: 5),
            Text(
              text,
              style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 18.5),
            ),
            if (isSelected)
              Icon(Icons.check, color: Color.fromARGB(255, 0, 0, 0)),
          ],
        ),
      ),
    );
  }
}

class sigin extends StatelessWidget {
  final Function onTap;
  final String btntext;
  sigin({required this.onTap, required this.btntext});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          btntext,
          style: TextStyle(color: Colors.white, fontSize: 18.5),
        ),
      ),
    );
  }
}


 