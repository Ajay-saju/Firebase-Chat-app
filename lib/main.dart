import 'package:chat_app/UI/Screens/auth_screen.dart';
import 'package:chat_app/UI/Screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColorDark: Colors.black54,
        primarySwatch: Colors.purple,
        backgroundColor: Colors.grey,
        
      ),
      home:   UserAutenticationScreen(),
    );
  }
}
