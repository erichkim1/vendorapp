import 'pet.dart';

class User {
  String firstName;
  String lastName;
  String email;
  String phone;
  String password;

  final String uid;

  User({this.uid});

  // List<PetProfile> pet;
  // Add payment method

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'password': password,
      'uid': uid,
      // 'pets': pet
    };
  }
}
