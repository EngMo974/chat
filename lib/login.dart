import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'chat.dart';
import 'main.dart';

class Login extends StatefulWidget {
  static const String id = 'LOGIN';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String email;
  String password;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginUser() async {
    FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email: email, password: password))
        .user;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Chat(user: user),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: 'logo',
              child: Container(
                width: 120,
                child: Image.asset('assets/icon/chat1.png'),
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value)=> email= value,
            decoration: InputDecoration(
                hintText: 'Enter Your Email',
                border: const OutlineInputBorder()),
          ),
          SizedBox(
            height: 18,
          ),
          SizedBox(
            height: 18,
          ),
          TextField(
            autocorrect: false,
            obscureText: true,
            onChanged: (value)=> password= value,
            decoration: InputDecoration(
                hintText: 'Enter Your Password',
                border: const OutlineInputBorder()),
          ),
          CoustomButtom(
            text: "Log in",
            callback: () async {
              await loginUser();
            },
          )
        ],
      ),
    );
  }
}
