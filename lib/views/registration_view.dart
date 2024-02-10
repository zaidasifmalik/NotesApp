import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/firebase_options.dart';

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
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('FuckClub'),
          ),
          body: FutureBuilder(
            future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform,
            ),
            builder: (context, snapshot) {
              switch(snapshot.connectionState){
              case ConnectionState.done:
              return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    const Text('Ultimate destination of Sigma'),
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
                        try{
                        final usercredentials = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: email, password: pass);
                        print(usercredentials);
                        }
                        on FirebaseAuthException catch(e)
                        {
                          if(e.code=='weak-password')
                          {
                            print('The Password is weak!');
                          }
                          else if(e.code=='invalid-email')
                          {
                            print('Invalid Email!');
                          }
                          else if(e.code =='email-already-in-use') {
                            print('The Email is already in use');
                          }
                        }
                      },
                      child: const Text('Enter FuckClub'),
                    ),
                  ]));
            default: 
              return const Center(
                child: Text("Loading!")
                );
            }},
          )),
    );
  }
}
