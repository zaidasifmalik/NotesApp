import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  late final TextEditingController _email = TextEditingController();
  late final TextEditingController _pass = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('Ultimate destination for Entrepreneurs'),
        TextField(
            controller: _email,
            decoration: const InputDecoration(
              hintText: 'Enter Email here',
            )),
        TextField(
            controller: _pass,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Enter Password here',
            )),
        ElevatedButton(
          onPressed: () async {
            final email = _email.text;
            final pass = _pass.text;
            try {
              final usercredentials = await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(email: email, password: pass);
              print(usercredentials);
            } on FirebaseAuthException catch (e) {
              if (e.code == 'weak-password') {
                print('The Password is weak!');
              } else if (e.code == 'invalid-email') {
                print('Invalid Email!');
              } else if (e.code == 'email-already-in-use') {
                print('The Email is already in use');
              }
            }
          },
          child: const Text('Enter FastBusinessClub'),
        ),
        TextButton(
          onPressed: () {
            //Navigator.pop(context);
          },
          child: const Text("Already Registered, Login Here!"),
        )
      ])),
    );
  }
}
