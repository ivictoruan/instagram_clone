import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/signup_screen.dart';
// import 'package:instagram_clone/responsive/mobile_screen_layout.dart';
// import 'package:instagram_clone/responsive/web_screen_layout.dart';
// import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
// import 'responsive/responsive_layout_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyC8PxFWUhcDncaOWhKVsfQaoPmO-AjqBdE", 
        appId: "1:233039097678:web:02e07ee01758e6f204f81f", 
        messagingSenderId: "233039097678", 
        projectId: "instagram-clone-15ca4",
        storageBucket: "instagram-clone-15ca4.appspot.com",
        ),
    );
  }else{
  await Firebase.initializeApp(); // Initialize Firebase
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',

      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),      
      
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(), 
      //   webScreenLayout: WebScreenLayout()
      // ),
      home: const SignupScreen(),
    );
  }
}
