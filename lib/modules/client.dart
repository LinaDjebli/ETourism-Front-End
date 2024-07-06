// client.dart
class Client {
  final String username;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String password;
  final String profilePicture;

  Client({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.password,
   required this.profilePicture,
  });

  Map<String, dynamic> toJson() {
    return {
      'username':username,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'email': email,
      'password': password,
      'profile_picture': profilePicture,
    };
  }
}