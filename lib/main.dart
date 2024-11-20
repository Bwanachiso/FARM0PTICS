// import 'package:flutter/material.dart';
// // Ensure this is the correct path for HomePage
// // import './auth/login.dart';
// import 'xxscreens/login_screen.dart'; // Ensure this is the correct path for LoginScreen

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'FARMOPTICS', // Optional: Add your app title
//       theme: ThemeData(
//         primarySwatch: Colors.blue, // Optional: Customize your app theme
//       ),
//       home: const LoginScreen(), // Set LoginScreen as the startup screen
//     );
//   }
// }

import 'package:farmoptics/components/consts.dart';
import 'package:farmoptics/xxscreens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import '../providers/user_provider.dart';

import '../services/auth_services.dart';
import 'package:provider/provider.dart';

void main() {
  Gemini.init(
    apiKey: GEMINI_API_KEY,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Node Auth',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginScreen()
        // home: Provider.of<UserProvider>(context).user.token.isEmpty ?
        //  Entry_door() : const HomeScreen(),
        );
  }
}
