import 'package:chat_app/UI/Widgets/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserAutenticationScreen extends StatefulWidget {
  const UserAutenticationScreen({Key? key}) : super(key: key);

  @override
  State<UserAutenticationScreen> createState() =>
      _UserAutenticationScreenState();
}

final auth = FirebaseAuth.instance;
void submitAuthForm(
    String password, String email, String name, bool isLogin,BuildContext context) async {
  UserCredential auhResult;

  try {
    if (isLogin) {
      auhResult = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(email);
    } else {
      auhResult = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(password);
    }
  } on PlatformException catch (err) {
    var msg = 'Check your credetials!';
    if (msg != null) {
      msg = err.message!;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: Theme.of(context).errorColor,
    ));
  }
}

class _UserAutenticationScreenState extends State<UserAutenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: AuthForm(),
        ),
      ),
    );
  }

//
}
