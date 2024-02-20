import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/firebase_options.dart';
import 'package:notesapp/views/login_view.dart';

import 'verify_email.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            user?.reload();
            print("siuuuu");
            print(user);
            if (user != null) {
              if (user.emailVerified)
                print('Verified User!');
              else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }

            return Text("Done!");
          default:
            return const Center(child: Text("Loading!"));
        }
      },
    );
  }
}
