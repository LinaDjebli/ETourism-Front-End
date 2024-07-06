import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'components/profile_menu.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profile";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Uint8List? _image;
  late String name;
  late String email;
  late String token;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? '';
      email = prefs.getString('email') ?? '';
     token = prefs.getString('token') ?? ''; // Load the token from shared preferences
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 65,
                        backgroundImage: MemoryImage(_image!),
                      )
                    : CircleAvatar(
                        radius: 65,
                        backgroundImage: AssetImage(
                            "lib/photos/default-avatar-icon-of-social-media-user-vector.jpg"),
                      ),
                Positioned(
                  child: IconButton(
                    onPressed: selectImage,
                    icon: Icon(Icons.add_a_photo),
                  ),
                  bottom: -13,
                  left: 80,
                ),
              ],
            ),
            Text(
              '$name',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              email,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 80),
            ProfileMenu(
              text: "My Account",
              icon: Icons.person,
              press: () {},
            ),
            ProfileMenu(
              text: "Notifications",
              icon: Icons.notifications,
              press: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: Icons.settings,
              press: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              icon: Icons.help,
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: Icons.logout,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
    uploadImage(img); // Upload the image after selecting it
  }

  Future<Uint8List> pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    }
    print("No image is selected");
    throw 'No image selected';
  }

  Future<void> uploadImage(Uint8List image) async {
   

  if (token == null) {
    print('No token found');
    return;
  }

  var request = http.MultipartRequest(
    'POST',
    Uri.parse('http://192.168.100.53:8000/api/update-profile-picture/'),
  );

  request.files.add(http.MultipartFile.fromBytes(
    'agency_profile_picture',
    image,
    filename: 'profile_picture.png',
  ));

  request.headers.addAll({
    'Authorization': 'Bearer $token',
  });

  var response = await request.send();

  if (response.statusCode == 200) {
    print('Profile picture updated successfully.');
  } else {
    print('Failed to update profile picture.');
  }
}

}
 
 
