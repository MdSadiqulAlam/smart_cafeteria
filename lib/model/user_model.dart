import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_cafeteria/utilities/formatter/formatter.dart';

///Model class repository user data
class UserModel {
  final String id;
  String firstName;
  String lastName;

  // final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  ///constructor for user model
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    // required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  ///helper function to get the full name
  String get fullName => '$firstName $lastName';

  ///helper function to format phone number
  String get formattedPhoneNo => MyFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts[1].toLowerCase();

    String cameCaseUsername = '$firstName$lastName';
    String usernameWithPrefix = "cwt_$cameCaseUsername";
    return usernameWithPrefix;
  }

  ///static function to create an empty user model
  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        // username: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
      );

  ///convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      // 'UserName': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  ///Factory method to create a UserModel from a Firebase document snapshot
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          firstName: data['FirstName'] ?? '',
          lastName: data['LastName'] ?? '',
          // username: data['UserName'] ?? '',
          email: data['Email'] ?? '',
          phoneNumber: data['PhoneNumber'] ?? '',
          profilePicture: data['ProfilePicture'] ?? '');
    }
    return UserModel.empty();
  }
//
}
