import 'dart:io';

import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:http/http.dart' as http;
//import 'package:phone_verification/phone_verification.dart';
import 'package:tro/Authentification/Signup.dart';
import 'package:tro/Authentification/login.dart';
import 'package:tro/Componants/List_Of_States.dart';
import 'package:tro/Componants/SelectChip.dart';
import 'package:tro/Componants/SizebaleTextField.dart';
import 'package:tro/Componants/SquaretTile.dart';
import 'package:tro/Componants/textfiled.dart';
import 'package:tro/Authentification/LOginChoice.dart';
import 'package:tro/Authentification/loginOrsignup.dart';
import 'package:tro/Authentification/signin.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tro/constants/Size.dart';
import 'package:tro/modules/guide.dart';
import 'package:tro/navigateur.dart';
import 'package:tro/screens2/main_screen.dart';
import 'package:tro/services/Authservice.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
import 'dart:io';
//import 'package:phone_verification/phone_verification.dart';
 
class GuideSignup extends StatefulWidget {
  
TextEditingController deteofbirth = _GuideSignup().datecontroller;
TextEditingController description = _GuideSignup().whatDoYouDo; 
bool gender = _GuideSignup().ismen;
TextEditingController location = _GuideSignup().location;
List<int> keys = _GuideSignup().finalchoice;
Uri licences = _GuideSignup().filecontroller;
File? licencesfile  = _GuideSignup()._licenseFile;
TextEditingController phonenumber = _GuideSignup().phoneController;
   GuideSignup({super.key});
  @override
  State<StatefulWidget> createState() {
    ;
    // TODO: implement createState
    return _GuideSignup();
  }
  setState(){
    if(_GuideSignup()._licenseFile != null) {
      licencesfile = _GuideSignup()._licenseFile;
    }

  }
}

class _GuideSignup extends State<GuideSignup> {
  List<String> selectedItems = [];
 TextEditingController datecontroller = TextEditingController();
  
  FocusNode _Focusenode = FocusNode();
   
  String errorPhone = "Enter a valid phone number";
  String errorWebsite = "Enter a valid website";
  String errorLocation = "Enter a valid location";
  String errorLicense = "Insert your license";
  String errordescription = "please fill this field";
  bool _isDataValide= true ;
  bool _isLanguageSelected = true ; 
  bool _isWebSiteValide = true ; 
  bool isLicencesValide = true ; 
  bool _isLocationValide =   true ;
  bool _isDescriptionValide = true ; 
  bool _isPhonenumbervalide = true ;

  bool isSelected = false;
  bool ismen = false;
  bool iswoemn = false;


  final TextEditingController whatDoYouDo = TextEditingController();
   final TextEditingController  websiteController= TextEditingController();
  final TextEditingController  location  = TextEditingController();
  TextEditingController _controller = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  Uri filecontroller = Uri(); 

void _validateDate(String value) {
  if( datecontroller.text.isNotEmpty ){
    setState(() {
       _isDataValide = true ; 
    });
  }}
  void _validateLocation(String value) {
  if(  location.text.isNotEmpty ){
    setState(() {
          _isLocationValide = true ; 
    });
  }}
  void _validatePhonenumber(String value) {
  if(   phoneController.text.isNotEmpty ){
    setState(() {
         _isPhonenumbervalide = true ; 
    });
  }}
  void _validateWebsite(String value) {
  if(   websiteController.text.isNotEmpty ){
    setState(() {
         _isWebSiteValide = true ; 
    });
  }}
  void _validateLicences(String value) {
  if(   _controller.text.isNotEmpty ){
    setState(() {
         isLicencesValide = true ; 
    });
  }}
 void _validateDescription(String value) {
  if(    whatDoYouDo.text.isNotEmpty ){
    setState(() {
          _isDescriptionValide = true ; 
    });
  }}
  
  final _formKey = GlobalKey<FormState>();
  File? _licenseFile;
  File? _profilePicture;
  final ImagePicker _picker = ImagePicker();
  Future<void> _pickLicenseFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _licenseFile = File(result.files.single.path!);
         filecontroller = _licenseFile!.uri;
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
  final List<int> finalchoice = [];
  void _openMultiSelect() async {
    final List<String> items = ["English", "French", "Italian", "Arabic"];
    
    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(
          items: items,
          Text: "choose your language ",
        );
      },
    );

    if (results != null) {
    setState(() {
      selectedItems = results;
      _isLanguageSelected = true;
      finalchoice.clear(); // Clear the list to avoid duplicate entries
       for( int i = 0 ; i < selectedItems.length ; i++){
        finalchoice.add(i+1);
       }
    });
  }else{
    setState(() {
       _isLanguageSelected =  false;
    });
      
  }
}

 
  @override
  Widget build(BuildContext context) {
    //bool isSelected = false;
    // TODO: implement build
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 41, 72, 206),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>    LoginChoice()),);
          },

        ),
        title: Text("personnal informations",style: TextStyle(color: Colors.white),),),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
          child: SingleChildScrollView(
              child:  Form(
                 key: _formKey,
                child: Column(children: [
                        const SizedBox(height: 50),
                        Row(
                          children: [
                            SizedBox(
                width: 30,
                            ),
                            Text(
                "Fill in your informations",
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  //font fam to add later
                ),
                            ),
                          ],
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                          SizedBox(
                            height: 150,
                            width: 180,
                            child: Image.asset("lib/photos/4722714.jpg"),
                          ),
                        ]),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            SizedBox(
                width: 30,
                            ),
                            Text(
                "chose your spoken languages",
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  //font fam to add later
                ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                             
                            
                            foregroundColor: Color.fromARGB(255, 255, 255, 255), backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Rounded corners
                            ),
                            minimumSize: Size(350, 60),
                          ),
                          onPressed: _openMultiSelect,
                          child: Text(
                            "Please select the languages you speak ",
                            style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: _isLanguageSelected? Color.fromARGB(255, 102, 102, 102):Color.fromARGB(255, 236, 60, 60)),
                          ),
                          
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          children: selectedItems
                .map((item) => Chip(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      label: Text(item),
                      onDeleted: () {
                        setState(() {
                          selectedItems.remove(item);
                        });
                      },
                    ))
                .toList(),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            SizedBox(
                width: 30,
                            ),
                            Text(
                            
                "enter your birthdate ",
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  //font fam to add later
                ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          
                          child: TextField(
                            
                            focusNode: _Focusenode,
                            controller: datecontroller,
                            
                            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.calendar_month,
                ),
                hintText: " yyyy/MM/DD",
                errorText: _isDataValide? null :"enter a valide birth date ",
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(108, 167, 165, 165),),
                  borderRadius:
                      BorderRadius.circular(10.0), // Set borderRadius here
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(108, 255, 255, 255)),
                  borderRadius:
                      BorderRadius.circular(10.0), // Set borderRadius here
                ),
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                filled: true,
                            ),
                            // readOnly: true,
                             onTap: () async {
                      _Focusenode.requestFocus();
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2025),
                      );

                      if (pickedDate != null) {
                        setState(() {
                          datecontroller.text = DateFormat("yyyy/MM/dd").format(pickedDate);
                        });
                      }
                    }
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            SizedBox(
                width: 30,
                            ),
                            Text(
                "Where are you currently located ? ",
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  //font fam to add later
                ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                     
                    SizebaleTextfield( onChanged: _validateLocation,errortext:errorLocation,eroorcond: _isLocationValide ,controller: location, sizefield:  1, max:  20, hintText:  "enter your location url  ", iconVisible:  false, iconOnPressed:  ()=>{}),
                
                        //regester now
                        const SizedBox(
                          height: 25,
                        ),
                   
                         
                SizedBox(
                  height: 25,
                ),
                 Row(
                          children: [
                            SizedBox(
                width: 30,
                            ),
                            Text(
                "enter your website  ",
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  //font fam to add later
                ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                     
                     _buildTextField(
                  controller: websiteController,
                  hintText: "Website link",
                 // labelText: "Enter agency website link",
                  errorText: _isWebSiteValide? null :errorWebsite,
                  onChanged:  _validateWebsite
                ),
                        //regester now
                        const SizedBox(
                          height: 25,
                        ),
                   
                         
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "choose your gender  ",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        //font fam to add later
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: 350,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected = true;
                        ismen = true;
                        iswoemn = false;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isSelected && ismen && !iswoemn
                            ? Colors.blue // Change color when selected
                            : Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: isSelected && ismen && !iswoemn
                                ? Colors.blue
                                : Color.fromARGB(255, 255, 255, 255), // Change border color when selected
                            width: 2), // Increase border width when selected
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset:
                                const Offset(0, 2), // shadow direction: bottom
                          ),
                          BoxShadow(
                            color: Color.fromARGB(255, 187, 186, 186)
                                .withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, -2), // shadow direction: top
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              padding: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Image.asset(
                                "lib/photos/casual-life-3d-profile-picture-of-man-in-green-shirt-and-orange-hat.png",
                                height: 60,
                              )),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            " i am a man  ",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: 350,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected = true;
                        iswoemn = true;
                        ismen = false;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isSelected && iswoemn && !ismen
                            ? Colors.blue // Change color when selected
                            : Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: isSelected && iswoemn && !ismen
                                ? Colors.blue
                                : Color.fromARGB(255, 255, 255, 255), // Change border color when selected
                            width: 2), // Increase border width when selected
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset:
                                const Offset(0, 2), // shadow direction: bottom
                          ),
                          BoxShadow(
                            color: Color.fromARGB(255, 172, 170, 170)
                                .withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, -2), // shadow direction: top
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              padding: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Image.asset(
                                "lib/photos/3d-casual-life-avatar-girl-with-hair.png",
                                height: 60,
                              )),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            " i am a Women ",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
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
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: IntlPhoneField(
                        initialCountryCode: 'DZ',
                        //onChanged: _validatePhonenumber,
                        controller: phoneController,
                        cursorColor: Color.fromARGB(255, 0, 0, 0),
                        style:  TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        decoration:  InputDecoration(
                          errorText: _isPhonenumbervalide? null :errorPhone,
                          labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          fillColor: Color.fromARGB(255, 0, 0, 0),
                          labelText: "Phone number",
                          border: OutlineInputBorder(borderSide: BorderSide()),
                        ),
                      ),
                    ),
                   
                 SizedBox(height: 25),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "What do you do ",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        //font fam to add later
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Describe yourslef in less than 200 character  ",
                      style: TextStyle(
                        color: Color.fromARGB(255, 161, 158, 158)
                            .withOpacity(0.7),
                
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        //font fam to add later
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                 
                    SizebaleTextfield(onChanged: _validateDescription, errortext:errordescription,eroorcond:_isDescriptionValide , controller:whatDoYouDo, sizefield:  1, max:  200, hintText:  "Describe what you do ", iconVisible:  false, iconOnPressed:  ()=>{}),
                
                        //regester now
                        const SizedBox(
                          height: 25,
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
                         if(_isLanguageSelected== false)
                         {
                            setState((){
                                _isLanguageSelected== !_isLanguageSelected;
                            });
                         }
                         if(datecontroller.text.isEmpty){
                          setState((){
                                _isDataValide==  !_isDataValide;
                            });
                         }
                         if(location.text.isEmpty){
                             setState((){
                                 _isLocationValide==  false;
                            });
                         }
                         if(websiteController.text.isEmpty){
                          setState((){
                                 _isWebSiteValide==  !_isWebSiteValide;
                            });
                         }
                         if(phoneController.text.isEmpty){
                              setState((){
                                 _isPhonenumbervalide==  !_isPhonenumbervalide;
                            });
                         }if(whatDoYouDo.text.isEmpty){

                          setState((){
                                 _isDescriptionValide==  !_isDescriptionValide;
                            });

                         }if(_controller.text.isEmpty){
                                 setState((){
                                 isLicencesValide==  !isLicencesValide;
                            });
                         }else{Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  SignUpGuide(keys: finalchoice, birthdate:  datecontroller.text,location:  location.text , gender : ismen , phonenumber:  phoneController.text , licences: _licenseFile ,description: whatDoYouDo.text,website: location.text,)),
            );};
                         
                      },
    child: Text('Submit'),
    ),
    gapH18,
                
                        
                      ]),
              ))),
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
          controller: _controller,
            readOnly: true,
            decoration: InputDecoration(
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

   
}

 

class SignUpGuide extends StatefulWidget {
  SignUpGuide({super.key, required this.birthdate , required this.location , required this.licences , required this.phonenumber , required this.gender , required this.keys , required this.description, required this.website});
   String birthdate ; 
   String location ; 
   File? licences ; 
    String phonenumber; 
   bool gender ; 
   List<int> keys ; 
    String description ;
     String website ;
  @override
  State<SignUpGuide> createState() => _SignUpGuideState();
}
 class _SignUpGuideState extends State<SignUpGuide> {
  final _formKey = GlobalKey<FormState>();
  final firstnamecntr = TextEditingController();
  final lastnamecntr = TextEditingController();
  final emailController = TextEditingController();
  final pwdcntr = TextEditingController();
  final pwdcntr2 = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
 // final TextEditingController _phoneNumberController = TextEditingController();
 File? _profilePicture;
  final ImagePicker _picker = ImagePicker();
  bool _isEmailValid = true;
  bool _isPasswordValid = true;
 // bool _isEmailNotUsed = false ; 
  bool visibleIcon1 =  true;
  bool visibleIcon2 =  true;
  bool _isLastNameValid = true;
  Icon passwordIcon1 = Icon(Icons.visibility_off);
  Icon passwordIcon2 = Icon(Icons.visibility_off);
  String passworderror1 = "must be 8 char plus numbers and special char ";
  String finrstnameerror = "please fill in this field";
  String lastnameerror = "please fill in this field";
  String emailerror = "invalide email ";
 String passworderror2 = "password dont match ";
   final FocusNode _focusNode = FocusNode();
  bool _isFirstNameValid = true;

 
   
    
Future<void> _pickProfilePicture() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profilePicture = File(pickedFile.path);
      });
    }
  }
  //final _authService = AuthService();
 bool isSelected = false;
  final Uri privacyPolicyUrl = Uri.parse("https://pub.dev/packages/url_launcher/install");

  Future<void> launchPrivacyPolicy() async {
    try {
      await launchUrl(privacyPolicyUrl);
    } catch (err) {
      // Handle error if necessary
    }
  }
 @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        // When the TextField loses focus, validate the content
        setState(() {
          _isFirstNameValid = firstnamecntr.text.isNotEmpty;
            lastnamecntr.text.isEmpty? _isLastNameValid =  false :_isLastNameValid = true;


        });
      }
    });
  }

  @override
  void dispose() {
    firstnamecntr.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     //  final RouteSettings settings = ModalRoute.of(context)!.settings;
   // final String fromPage = settings.arguments as String;
    // _phoneNumberController.text = "1234"; 
    return Scaffold(
       
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          
            child: Form(
              key: _formKey,
              child: Column(
               
                children: [
                  
                  const SizedBox(height: 50),
                  Text(
                    "Hello!",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 50,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Welcome back ',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Create your account ',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       SizedBox(
                        width: 120,
                        child: TextField(
                         onTap: ()=>{setState(() {
                             _isFirstNameValid = true;
                         },)},
                          cursorColor: Colors.black,
                          controller: firstnamecntr,decoration: InputDecoration(labelText: 'first name  ',
                          labelStyle: TextStyle(color:Colors.black),
                           errorText: _isFirstNameValid ? null : finrstnameerror,
                      
                        //  errorText: firstnamecntr.text.isNotEmpty ?null : 'please fill in ',
                        
                           enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black, // Set the color of the enabled bottom border
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black, // Set the color of the focused bottom border
          width: 2.0,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red, // Set the color of the error bottom border
        ),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red, // Set the color of the focused error bottom border
          width: 2.0,
          
        ),
        
      ),),)),
                         SizedBox(
                          
                        width: 120,
                        child: TextField(
                          onTap: ()=>{setState(() {
                            _isLastNameValid = true;
                          },)},
                          cursorColor: Colors.black,
                          controller:  lastnamecntr,decoration: InputDecoration(labelText: 'last name ',
                            labelStyle: TextStyle(color:Colors.black),
                               errorText: _isLastNameValid ? null :  lastnameerror,
                        
                           enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black, // Set the color of the enabled bottom border
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black, // Set the color of the focused bottom border
          width: 2.0,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red, // Set the color of the error bottom border
        ),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red, // Set the color of the focused error bottom border
          width: 2.0,
          
        ),
        
      ),),))
                   
                    ],
                  ),
                  SizedBox(height: 15),

                    
                  
                     /*  SizedBox(
                        width: 120,
                        child: TextField(
                         onTap: ()=>{setState(() {
                             _isFirstNameValid = true;
                         },)},
                          cursorColor: Colors.black,
                          controller: firstnamecntr,decoration: InputDecoration(labelText: 'phonecode',
                          labelStyle: TextStyle(color:Colors.black),
                           errorText: _isFirstNameValid ? null : finrstnameerror,
                      
                        //  errorText: firstnamecntr.text.isNotEmpty ?null : 'please fill in ',
                        
                           enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black, // Set the color of the enabled bottom border
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black, // Set the color of the focused bottom border
          width: 2.0,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red, // Set the color of the error bottom border
        ),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red, // Set the color of the focused error bottom border
          width: 2.0,
          
        )
        
      ),),)),*/
                 SizedBox(
                  width: 310,
                   child: TextField(
                    onTap: ()=>{
                      setState(() {
                        emailerror = "enter a valid email "; 
                      },)
                     
                    },
                    cursorColor: Colors.black,
                                 controller: _emailController,
                                 decoration: InputDecoration(
                                   labelText: 'Email',
                                   errorText:  _isEmailValid ?  null : emailerror,
                                   enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black, // Set the color of the enabled bottom border
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black, // Set the color of the focused bottom border
          width: 2.0,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red, // Set the color of the error bottom border
        ),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red, // Set the color of the focused error bottom border
          width: 2.0,
          
        ),
        
      ),
      labelStyle: TextStyle(color:Colors.black),
    
      fillColor: Color.fromARGB(255, 165, 165, 165),
                                 ),
                                 onChanged: _validateEmail,
                               ),
                 ),
                  
                  SizedBox(height: 15),
               SizedBox(
                width: 310,
                 child: TextField(
                  onTap: ()=> {
                      setState(() {
                        passworderror1 = "8 char plus niber and special char";
                      },)
                  },
                               controller: _passwordController,
                               obscureText:visibleIcon1 ? true : false,
                               decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: _isPasswordValid ? null : passworderror1,
                               prefixIcon: Icon(Icons.lock)  ,
                               suffixIcon:IconButton(
                                color: Colors.black,
                             onPressed: () {
                               setState(() {
                  visibleIcon1 = !visibleIcon1;
                  passwordIcon1 = visibleIcon1
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility);
                               });
                             },
                             icon: passwordIcon1,
                           ),

                           enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black, // Set the color of the enabled bottom border
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black, // Set the color of the focused bottom border
          width: 2.0,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red, // Set the color of the error bottom border
        ),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red, // Set the color of the focused error bottom border
          width: 2.0,
          
        ),
        
      ),
      labelStyle: TextStyle(color:Colors.black), ),
                               
                               
                               onChanged: _validatePassword,
                             ),
               ),
                  SizedBox(height: 15),

                   SizedBox(
                width: 310,
                 child: TextField(
                  cursorColor: Colors.black,
                               controller: pwdcntr2 ,
                               obscureText: visibleIcon2,
                               decoration: InputDecoration(
                  labelText: 'Password',
                  errorText:  pwdcntr2.text == _passwordController.text ? null : passworderror2,
                               prefixIcon: Icon(Icons.lock)  ,
                               suffixIcon:IconButton(
                                color: Colors.black,
                             onPressed: () {
                               setState(() {
                  visibleIcon2 = !visibleIcon2;
                  passwordIcon2 = visibleIcon2
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility);
                               });
                             },
                             icon: passwordIcon2,
                           ),
                           enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black, // Set the color of the enabled bottom border
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black, // Set the color of the focused bottom border
          width: 2.0,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red, // Set the color of the error bottom border
        ),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red, // Set the color of the focused error bottom border
          width: 2.0,
          
        ),
        
      ),
      labelStyle: TextStyle(color:Colors.black),
            // Use the hint text from the widget
        ),
                               
                             
                             ),
               ),
               gapH14,
                  
                  const SizedBox(height: 20),
                  sigin(
                    onTap:()=>{ 
                       
                       if(_emailController.text.isEmpty ){
                           setState(() => {
                             
                             _isEmailValid = false ,
                             emailerror = "fill in your email ",
                             _isPasswordValid = false , 
                             passworderror1 = "fill in a password"
                            

                           },)

                        
                             
                       }, 
                       if( firstnamecntr.text.isEmpty ){
                           setState(() => {
                             _isFirstNameValid = false , 
                             finrstnameerror = " fill in this"
                            

                           },)

                        
                             
                       },  if(  lastnamecntr.text.isEmpty ){
                           setState(() => {
                              _isLastNameValid = false , 
                             lastnameerror = " fill in this"
                            

                           },)

                        
                             
                       },  if(  _passwordController.text.isEmpty ){
                           setState(() => {
                               _isPasswordValid = false , 
                              passworderror1 = " fill in this"
                            

                           },)} else{

                               _guideregester()
                           }
                      
                      }
,
                    btntext: "Sign in ",
                  ),
                  const SizedBox(height: 25),
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
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                
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
                          Icon(Icons.apple),
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Continue with apple  ",
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
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an account  ? ",
                        style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
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
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        
      ),
    );
  }
void _validateEmail(String value) {
    setState(() {
      _isEmailValid = EmailValidator.validate(value);
    });
  }
   
   bool _isStrongPassword(String value) {
    // Add your password strength validation logic here
    // Example: Minimum length of 8, must contain uppercase, lowercase, number, and special character
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

  

 

 Future<void> _guideregester() async {
  
     
 if (widget.licences == null) {
    print('License file is null.');
    if (widget.keys != null) {
        for (int item in widget.keys) {
            print("keys are: $item");
        }
    } else {
        print('Widget keys are null.');
    }
    return;
}
     Guide  guide =  Guide(
     username: firstnamecntr.text+lastnamecntr.text, 
     guideEmail:_emailController.text,
     guidePhoneNumber: widget.phonenumber,
     password:  _passwordController.text, 
     guideFirstName: firstnamecntr.text,
     guideLastName: lastnamecntr.text, 
     guideWebsite: widget.location, 
     guideLicenses: widget.licences,
     guideProfilePicture: _profilePicture, 
     guideLocation: widget.location,
     guideLanguages: widget.keys,
     
     gender: "M",
     guidedateofbirth: widget.birthdate, 
     guidedescription: widget.description,
      
       
    );

    final  respone =  await _apiService.registerGuide(guide);
try{ if (respone?. statusCode == 201) {
      print('Form data sent successfully');
      print(widget.keys);
      // Navigate to the new page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeWrapper2(), // Replace NewPage with your actual page widget
        ),
      );
    }}catch(e){}
   
    //await guide.sendGuideData(guide);
  }

   final ApiService _apiService = ApiService();




void sendFormData(List<String> selectedLanguages) async {
  final String url = 'http://192.168.100.53:8000/api/signup/guide/';
  Dio dio = Dio();

  String g = widget.gender ? "M" : "F";

  // Prepare the data payload
  var data = {
    'username': firstnamecntr.text + lastnamecntr.text,
    'guide_email': _emailController.text,
    'guide_first_name': firstnamecntr.text,
    'guide_last_name': lastnamecntr.text,
    'password':  _passwordController.text,
    'guide_phone_number': widget.phonenumber,
    'guide_website': widget.location,
    'guide_location': widget.location,
    'guide_gender': g,
    'guide_dateofbirth': widget.birthdate,
    'guide_description': widget.description,
  };

  // Create FormData object and add text fields
  FormData formData = FormData.fromMap({
    ...data,
    'guide_licenses': widget.licences != null
        ? await MultipartFile.fromFile(
            widget.licences!.path,
            filename: widget.licences!.path.split('/').last,
          )
        : null,
    'guide_profile_picture': _profilePicture != null
        ? await MultipartFile.fromFile(
            _profilePicture!.path,
            filename: _profilePicture!.path.split('/').last,
          )
        : null,
  });

  // Add each language index as a separate guide_languages field
  

  // Print formData for debugging
  print('FormData: $formData');

  // Send the request using Dio
  try {
    var response = await dio.post(url, data: formData);
    if (response.statusCode == 201) {
      print('Form data sent successfully');
    } else {
      print('Failed to send form data. Status code: ${response.statusCode}');
      print('Response body: ${response.data}');
      for (int i = 0; i < selectedLanguages.length; i++) {
        print(selectedLanguages[i].toString());
      }
    }
  } catch (e) {
    print('Error sending form data: $e');
  }
}

  
}

  
    


