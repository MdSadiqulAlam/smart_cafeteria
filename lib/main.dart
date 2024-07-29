import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_cafeteria/firebase_options.dart';

import 'data/repositories/authentication/authentication_repository.dart';
import 'myapp.dart';

Future<void> main() async {
  /// Widget binding
  WidgetsFlutterBinding.ensureInitialized();

  /// init local storage
  await GetStorage.init();

  /// todo: init payment method
  /// todo: await native splash
  // FlutterNativeSplash
  // initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  ///run the app
  runApp(const MyApp());

  /// todo: initialize authentication
}



// style: GoogleFonts.poppins(fontSize: 17, color: Theme.of(context).colorScheme.onSecondaryContainer, fontWeight: FontWeight.w500,),
