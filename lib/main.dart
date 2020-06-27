import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:hack20_atomica/stores/auth_store/authstore.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'models/user_model.dart';

void main() {
  runApp(MaterialApp(home: MainApp()));
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  AuthStore authStore = new AuthStore();
  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) =>
            authStore.user.name == " " ? Login() : Test(authStore.user));
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthStore authStore = new AuthStore();
  bool trying;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trying = false;
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
            builder: (context) => GestureDetector(
              onTap: () => {
                setState(() {
                  trying = true;
                }),
                authStore.googleSignIn().then((value) => {
                      setState(() {
                        trying = authStore.trying;
                      }),
                      print(authStore.user.name),
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Test(authStore.user)))
                    })
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2.1,
                height: 100,
                child: FlareActor("assets/google_sign_in.flr",
                    fit: BoxFit.contain, animation: trying ? "go" : "idle"),
              ),
            ),
          ),
          FlatButton(onPressed: authStore.signOut, child: Text("LogOut"))
        ],
      ),
    );
  }
}

class Test extends StatelessWidget {
  AuthStore auth = new AuthStore();
  User user;
  Test(user) {
    this.user = user;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(user.name),
          FlatButton(
              onPressed: () {
                auth.signOut().then(
                      (value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainApp(),
                        ),
                      ),
                    );
              },
              child: Text("Logout")),
        ],
      ),
    );
  }
}
