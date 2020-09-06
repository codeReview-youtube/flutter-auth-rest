import 'package:flutter/material.dart';

import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool checked = false;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Container(
        margin: EdgeInsets.only(top: 300.0, left: 30.0, right: 30.0),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                emailField(),
                passwordField(),
                checkbox(),
                button(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (value) {
        setState(() {
          email = value;
        });
      },
      decoration: const InputDecoration(
          icon: Icon(Icons.email),
          hintText: 'someone@company.com',
          labelText: 'Email'),
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      validator: validatePassword,
      onSaved: (value) {
        setState(() {
          password = value;
        });
      },
      decoration: const InputDecoration(
          icon: Icon(Icons.visibility_off),
          hintText: 'Enter password',
          labelText: 'Password'),
    );
  }

  Widget checkbox() {
    return Row(
      children: <Widget>[
        Checkbox(
          value: checked,
          onChanged: (isChecked) => setState(() => checked = isChecked),
          activeColor: Colors.blue,
          focusColor: Colors.pink,
        ),
        Text('keep me logged in'),
      ],
    );
  }

  Widget button() {
    return Container(
      alignment: Alignment.bottomRight,
      margin: EdgeInsets.only(top: 100.0, left: 130.0),
      child: Row(
        children: <Widget>[
          Text(
            'Login',
            style: TextStyle(
              color: Colors.blue[400],
              fontSize: 20.0,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            splashColor: Colors.pink[300],
            onPressed: () {
              if (_formKey.currentState.validate()) {
                // print
                _formKey.currentState.save();
                print('$email with $password is valid');
              }
            },
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
