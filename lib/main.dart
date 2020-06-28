import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:hack20_atomica/pages/login.dart';
import 'package:hack20_atomica/stores/auth_store/authstore.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'models/user_model.dart';

void main() {
  runApp(MaterialApp(theme: ThemeData(fontFamily: "Panton",canvasColor: Color(0xff1b1b1b)),home: SafeArea(child: MainApp())));
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  AuthStore authStore = new AuthStore();
  @override
  Widget build(BuildContext context) {
    return Login();
  }
}//auth user check laga dena check commit #2
