import 'package:flutter/material.dart';
import 'package:login_bloc/src/screens/login_screen.dart';

class App extends StatelessWidget{
 @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Log me in",
      home: Scaffold(
        body: SafeArea(
            child: LoginScreen()
        ),
      ),
    );
  }
}