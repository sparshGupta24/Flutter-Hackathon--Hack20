import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hack20_atomica/pages/hub.dart';
import 'package:hack20_atomica/stores/auth_store/authstore.dart';

import '../main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthStore authStore = new AuthStore();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1b1b1b),
      body: Column(
        children: [
          SizedBox(height: 50),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 951 * 1024,
            child: FlareActor("assets/logo.flr",
                fit: BoxFit.contain, animation: "Untitled"),
          ),
          Observer(
            name: 'login',
            builder: (context) => GestureDetector(
              onTap: () => {
                authStore.googleSignIn().then((value) => {
                      print(authStore.user.name),
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Hub(authStore.user)))
                    })
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2.1,
                height: 100,
                child: FlareActor("assets/google_sign_in.flr",
                    fit: BoxFit.contain, animation: authStore.trying ? "go" : "idle"),
              ),
            ),
          ),
          FlatButton(onPressed: authStore.signOut, child: Text("LogOut"))
        ],
      ),
    );
  }
}
