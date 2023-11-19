import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // void signOut() {
  //   FirebaseAuth.instance.signOut();
  // }

  // final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              // signOut();
            },
            icon: Icon(Icons.logout_outlined))
      ]),
      body: Center(
        child: Text("Logged In as:"),
      ),
    );
  }
}
