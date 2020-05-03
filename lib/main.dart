import 'package:chat/login.dart';
import 'package:chat/registeration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      initialRoute: MyHomePage.id,
      routes: {
        MyHomePage.id: (context) => MyHomePage(),
        Registration.id: (context) => Registration(),
        Login.id: (context) => Login(),
        Chat.id: (context) => Chat()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const String id = "HOMESCREEN";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  width: 100,
                  child: Image.asset('assets/icon/chat1.png'),
                ),
              ),
              Text(
                'Chat',
                style: TextStyle(fontSize: 40),
              ),
            ],
          ),
          SizedBox(
            height: 48,
          ),
          CoustomButtom(
            text: 'Log In',
            callback: () {
              Navigator.of(context).pushNamed(Login.id);
            },
          ),
          SizedBox(
            height: 16,
          ),
          CoustomButtom(
            text: 'Register',
            callback: () {
              Navigator.of(context).pushNamed(Registration.id);
            },
          ),
        ],
      ),
    );
  }
}

class CoustomButtom extends StatelessWidget {
  final VoidCallback callback;
  final String text;

  const CoustomButtom({Key key, this.callback, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Material(
        color: Colors.blueGrey,
        elevation: 8,
        borderRadius: BorderRadius.circular(28),
        child: MaterialButton(
          onPressed: callback,
          minWidth: 200,
          height: 48,
          child: Text(
            text,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
