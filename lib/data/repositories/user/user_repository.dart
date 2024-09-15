import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// import 'package:image_picker/image_picker.dart';
// import 'package:t_store/data/repositories.authentication/authentication_repository.dart';
// import 'package:t_store/utils/exceptions/format_exceptions.dart';
// import 'package:t_store/utils/exceptions/platform_exceptions.dart';

import 'package:smart_cafeteria/model/user_model.dart';
import '../../../utilities/exceptions/firebase_auth_exceptions.dart';
import '../../../utilities/exceptions/firebase_exceptions.dart';
import '../../../utilities/exceptions/format_exceptions.dart';
import '../../../utilities/exceptions/platform_exceptions.dart';

// import '../../../utils/exceptions/firebase_exceptions.dart';
// import '../../features/personalization/models/user_models.dart';
import '../authentication/authentication_repository.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //function to save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MyFormatException();
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw "Something Went Wrong. Please try again.";
    }
  }

//function to fetch user details based on user ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).get();

      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MyFormatException();
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw "Something Went Wrong. Please try again.";
    }
  }

  //function to update user data in firebase
  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      await _db.collection('Users').doc(updateUser.id).update(updateUser.toJson());
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MyFormatException();
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw "Something Went Wrong. Please try again.";
    }
  }

  //update any field in specific users collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MyFormatException();
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw "Something Went Wrong. Please try again.";
    }
  }

//
//   //function to remove user data from Firestore
//   Future<void> removeUserRecord(String userId) async {
//     try {
//       await _db.collection('Users').doc(userId).delete();
//     } //on FirebaseAuthException catch(e) {
//     // throw TFirebaseAuthException(e.code).message;
//     // }
//     on FirebaseException catch (e) {
//       throw TFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const TFormatException();
//     } on PlatformException catch (e) {
//       throw TPlatformException(e.code).message;
//     } catch (e) {
//       throw "Something Went Wrong. Please try again.";
//     }
//   }
//
  ///Upload any Image
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MyFormatException();
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw "Something Went Wrong. Please try again.";
    }
  }
}
