import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

var isLogin = true;
var name = '';
var password = '';
var email = '';
final formKey = GlobalKey<FormState>();

class _AuthFormState extends State<AuthForm> {
 
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  key: const ValueKey('name'),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 4) {
                      return 'Invalid User name ';
                    }
                    return null;
                  },
                  onSaved: ((newValue) {
                    name = newValue!;
                  }),
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(label: Text("Name")),
                ),
                TextFormField(
                  key: const ValueKey('email'),
                  onSaved: (newValue) {
                    email = newValue!;
                  },
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(label: Text("Email")),
                ),
                if (!isLogin)
                  TextFormField(
                    key: const ValueKey('password'),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 8) {
                        return 'Password too short';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      password = newValue!;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: const InputDecoration(label: Text("Password")),
                  ),
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                    onPressed: () {
                      _trySubmit();
                    },
                    child: Text(isLogin ? 'Login' : 'Signup')),
                const SizedBox(
                  height: 8,
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
                    child: Text(isLogin
                        ? 'Create new Account'
                        : 'You already have a account'))
              ],
            )),
      ),
    );
  }

 

  void _trySubmit() {
    final isValidate = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValidate) {
      formKey.currentState!.save();
      
    }
  }
}
