import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../mixins/validation_mixin.dart';

class FormBloc with ValidationMixin {
  final _email = new BehaviorSubject<String>();
  final _password = new BehaviorSubject<String>();

  // getters: Changers
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;
  // getters: Add stream
  Stream<String> get email => _email.stream.transform(validatorEmail);
  Stream<String> get password => _password.stream.transform(validatorPassword);

  Stream<bool> get submitValidForm =>
      Rx.combineLatest2(email, password, (e, p) => true);

  submit() {
    print(_email.value);
    print(_password.value);
  }

  // close streams
  dispose() {
    _email.close();
    _password.close();
  }
}
