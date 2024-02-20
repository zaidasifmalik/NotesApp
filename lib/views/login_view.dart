import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
      appBar: AppBar(title: const Text("Login"),),
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
                  .signInWithEmailAndPassword(email: email, password: pass);
              print(usercredentials);
            } on FirebaseAuthException catch (e) {
              if (e.code == "invalid-credential") {
                print('User not found!');
              }
            }
          },
          child: const Text('Login'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/registration/', (route) => false);
          },
          child: const Text("Click Here to Register First!"),
        )
      ])),
    );
  }
}
