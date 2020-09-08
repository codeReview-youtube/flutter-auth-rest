import 'package:flutter/material.dart';
import 'package:login_statefull/src/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  // render
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 400),
          child: Column(
            children: [
              Text('Home Screen'),
              RaisedButton(
                child: Text('Log out'),
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/login');
                  AuthService.removeToken();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
