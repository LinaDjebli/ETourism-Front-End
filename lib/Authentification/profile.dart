import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
   Profile({super.key , required this.name , required this.lastname , required this.email});
   TextEditingController name ; 
   TextEditingController lastname ; 
   TextEditingController email ; 

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Uint8List? _image ;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    body: SafeArea(
      
      child: SingleChildScrollView(
        
        
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [



            Stack(
              alignment:Alignment.center,
              children: [
                _image != null?
               CircleAvatar(
                radius:  65 ,
                backgroundImage: MemoryImage(_image!) ,
               ) 
             : CircleAvatar(
                radius: 65,
                 backgroundImage: AssetImage("lib/photos/default-avatar-icon-of-social-media-user-vector.jpg"),
              ),
              Positioned(child: IconButton(onPressed:selectImage,icon: Icon(Icons.add_a_photo), ),bottom: -13,left: 80,)




              ],)
          ]) ,
        
      ),
      ), 

    );
  }

  void selectImage() async {

 Uint8List img = await  pickImag(ImageSource.gallery);
 setState(() {
    _image = img ; 
 });


  }
}

pickImag(ImageSource source) async {
  final ImagePicker _imagepicker = ImagePicker();
  XFile? _file = await _imagepicker.pickImage(source: source);
  if(_file != null ){
    return await _file.readAsBytes();
  }
print ("No image is selected ");
}