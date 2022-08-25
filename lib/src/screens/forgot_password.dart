import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForgotPassword extends StatelessWidget {
// render
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0, systemOverlayStyle: SystemUiOverlayStyle.dark,
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
