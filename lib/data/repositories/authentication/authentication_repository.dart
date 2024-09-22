import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_cafeteria/pages/authentication/login/login.dart';
import 'package:smart_cafeteria/pages/authentication/signup/components/email_verification_bottom_sheet.dart';
import 'package:smart_cafeteria/pages/role_based_enter/role_based_enter_screen.dart';
import 'package:smart_cafeteria/pages/root_page.dart';
import 'package:smart_cafeteria/utilities/exceptions/firebase_auth_exceptions.dart';
import 'package:smart_cafeteria/utilities/exceptions/format_exceptions.dart';
import 'package:smart_cafeteria/utilities/exceptions/platform_exceptions.dart';

import '../../../pages/admin/admin_login/admin_login.dart';
import '../../../pages/onboarding/onboarding.dart';
import '../../../utilities/exceptions/firebase_exceptions.dart';

class AuthenticationRepository extends GetxController {
  //getter method
  static AuthenticationRepository get instance => Get.find();

  //variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //Get Authenticated user data
  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    ///redirect to the appropriate
    // screenRedirect();
    roleSelect();
  }

  Future<void> roleSelect() async {
    Get.offAll(() => const RoleBasedEnterScreen());
  }

  /// Function to show relevant screen
  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      // Get.offAll(() => const RootPage());
      Get.to(()=>const RootPage());
      if (user.emailVerified == false) {
        emailVerificationBottomSheet(context: Get.overlayContext!, email_: user.email!);
      }
    } else {
      await deviceStorage.writeIfNull('isFirstTime', true);

      /// todo : correct route based on first time
      Get.to(()=> const Onboarding());
      // deviceStorage.read('isFirstTime') != true
      //     ? Get.offAll(() => const RoleBasedEnterScreen())
      //     : Get.offAll(() => const Onboarding());
    }
  }

  void adminScreenRedirect() {
    // Get.offAll(() =>const AdminLogin());
    Get.to(()=>const AdminLogin());
  }

  /// Email login authentication
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MyFormatException();
    } on MyPlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw "Something Went Wrong. Please try again";
    }
  }

  /// Email register authentication
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const MyFormatException();
    } on MyPlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw "Something Went Wrong";
    }
  }

  /// Email verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MyFormatException();
    } on MyPlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw "Something Went Wrong";
    }
  }

// /// Forget password
//
// Future<void> sendPasswordResetEmail(String email) async {
//   try {
//     await _auth.sendPasswordResetEmail(email: email);
//   } on FirebaseAuthException catch (e) {
//     throw TFirebaseAuthException(e.code).message;
//   } on FirebaseException catch (e) {
//     throw TFirebaseException(e.code).message;
//   } on FormatException catch (_) {
//     throw const TFormatException();
//   } on PlatformException catch (e) {
//     throw TPlatformException(e.code).message;
//   } catch (e) {
//     throw "Something Went Wrong";
//   }
// }
//
// ///Re authenticate user
// Future<void> reAuthenticateWithEmailAndPassword(
//     String email, String password) async {
//   try {
//     AuthCredential credential =EmailAuthProvider.credential(
//         email: email, password: password);
//     await _auth.currentUser!.reauthenticateWithCredential(credential);
//   } on FirebaseAuthException catch (e) {
//     throw TFirebaseAuthException(e.code).message;
//   } on FirebaseException catch (e) {
//     throw TFirebaseException(e.code).message;
//   } on FormatException catch (_) {
//     throw const TFormatException();
//   } on PlatformException catch (e) {
//     throw TPlatformException(e.code).message;
//   } catch (e) {
//     throw "Something Went Wrong. Please try again";
//   }
// }
//
// /// Google SignIn Authentication
//
// Future<UserCredential> signInWithGoogle() async {
//   try {
//     // Trigger the authentication flow
//     final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
//
//     // Obtain the auth details from the request
//     final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;
//
//     // Create a new credential
//     final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
//
//     // Once signed in, return the UserCredential
//     return await _auth.signInWithCredential(credentials);
//
//   } on FirebaseAuthException catch (e) {
//     throw TFirebaseAuthException(e.code).message;
//   } on FirebaseException catch (e) {
//     throw TFirebaseException(e.code).message;
//   } on FormatException catch (_) {
//     throw const TFormatException();
//   } on PlatformException catch (e) {
//     throw TPlatformException(e.code).message;
//   } catch (e) {
//     throw "Something Went Wrong";
//   }
// }
//
// Logout User

  Future<void> logout() async {
    try {
      // await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MyFormatException();
    } on MyPlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw "Something Went Wrong. Please try again";
    }
  }

// ///delete account
// Future<void> deleteAccount() async {
//   try {
//     await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
//     await _auth.currentUser?.delete();
//
//   } on FirebaseAuthException catch (e) {
//     throw TFirebaseAuthException(e.code).message;
//   } on FirebaseException catch (e) {
//     throw TFirebaseException(e.code).message;
//   } on FormatException catch (_) {
//     throw const TFormatException();
//   } on PlatformException catch (e) {
//     throw TPlatformException(e.code).message;
//   } catch (e) {
//     throw "Something Went Wrong. Please try again";
//   }
// }
}
