import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:instagram_clone/responsive/mobile_screen_layout.dart';
import 'package:instagram_clone/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone/responsive/web_screen_layout.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyC8PxFWUhcDncaOWhKVsfQaoPmO-AjqBdE",
        appId: "1:233039097678:web:02e07ee01758e6f204f81f",
        messagingSenderId: "233039097678",
        projectId: "instagram-clone-15ca4",
        storageBucket: "instagram-clone-15ca4.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp(); // Initialize Firebase
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(     
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) { // se o usuário está logado
                if (snapshot.hasData) { // usuário está autenticado
                  return const ResponsiveLayout(
                      mobileScreenLayout: MobileScreenLayout(),
                      webScreenLayout: WebScreenLayout());
                } else if (snapshot.hasError) { // deu erro
                  return Center(child: Text('${snapshot.error}'));
                }
              }
              if (snapshot.connectionState == ConnectionState.waiting) { // esperando conexão
                return const Center(
                    child: CircularProgressIndicator(color: primaryColor));
              }
            return const LoginScreen(); // usuário não está autenticado
            }),
      ),
    );
  }
}
