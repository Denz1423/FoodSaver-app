import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ml_app/screens/recipeList_screen.dart';
import 'package:ml_app/screens/results_screen.dart';

import './screens/ml_screen.dart';
import './screens/auth_screen.dart';
import './screens/results_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
      future: _initialization,
      builder: (context, appSnapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ML-App',
          theme: ThemeData(
              primarySwatch: Colors.green,
              backgroundColor: Colors.green,
              accentColor: Colors.amber,
              accentColorBrightness: Brightness.dark,
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(primary: Colors.lightBlue),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(primary: Colors.green),
              )),
          home:
              MlScreen(),
          //     StreamBuilder(
          //   stream: FirebaseAuth.instance.authStateChanges(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return MlScreen();
          //     }
          //     return AuthScreen();
          //   },
          // ),
          routes: {
            MlScreen.routeName: (ctx) => MlScreen(),
            ResultScreen.routeName: (ctx) => const ResultScreen(),
            RecipeListScreen.routeName: (ctx) => new RecipeListScreen(),
          },
          onUnknownRoute: (settings) {
            return MaterialPageRoute(builder: (context) => MlScreen());
          },
        );
      },
    );
  }
}
