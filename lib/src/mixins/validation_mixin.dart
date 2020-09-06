import 'dart:async';

class ValidationMixin {
  // with Provider state
  final validatorEmail = new StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.isEmpty) {
        sink.addError('Email is required');
      } else if (email.length < 8) {
        sink.addError('Email is too short!');
      } else if (!email.contains('@')) {
        sink.addError('Please enter a valid email');
      } else if (email.contains(' ')) {
        sink.addError('Space not allowd! 😏');
      } else {
        sink.add(email);
      }
    },
  );

  final validatorPassword = new StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length > 8) {
        sink.add(password);
      } else {
        sink.addError('Passwords must be at least 8 characters!');
      }
    },
  );
  // without Provider state
  String validateEmail(String email) {
    var regExp = new RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (email.isEmpty) {
      return 'Email is required';
    }
    if (regExp.hasMatch(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String validatePassword(String password) {
    var regExp = new RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    if (password.isEmpty) {
      return 'Password is required';
    }
    if (password.length < 8) {
      return 'Password should more than 8 characters';
    }
    if (regExp.hasMatch(password)) {
      return 'Please enter a valid password!';
    }
    return null;
  }
}
