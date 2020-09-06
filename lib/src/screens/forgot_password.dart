import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
// render
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Text('Forgot password'),
        ),
      ),
    );
  }
}
