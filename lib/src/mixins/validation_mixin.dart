import 'dart:async';

class ValidationMixin {
  // with Provider state
  final validatorEmail = new StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      // if (email.isEmpty) {
      //   sink.addError('Email is required');
      // } else if (!email.contains('@')) {
      //   sink.addError('Please enter a valid email');
      // } else if (email.contains(' ')) {
      //   sink.addError('Space not allowd! 😏');
      // } else {
      //   sink.add(email);
      // }
      if (ValidationMixin()._validateEmail(email)) {
        sink.addError('Emmail is not valid');
      } else {
        sink.add(email);
      }
    },
  );

  final validatorPassword = new StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (!ValidationMixin()._validatePassword(password)) {
        sink.addError('Password is not valid!');
      } else {
        sink.add(password);
      }
    },
  );
  // without Provider state
  bool _validateEmail(String email) {
    var regExp = new RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    // if (email.isEmpty) {
    //   return false;
    // }
    if (regExp.hasMatch(email)) {
      return false;
    }
    return true;
  }

  bool _validatePassword(String password) {
    var regExp = new RegExp(r'^(?=.*?[A-Z][a-z]).{8,}$');
    // if (password.isEmpty) {
    //   return false;
    // }
    // if (password.length < 8) {
    //   return false;
    // }
    if (regExp.hasMatch(password)) {
      return false;
    }
    return true;
  }
}
