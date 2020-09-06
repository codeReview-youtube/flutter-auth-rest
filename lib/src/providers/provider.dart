import 'package:flutter/material.dart';

import '../blocs/form_bloc.dart';

class Provider extends InheritedWidget {
  final bloc = new FormBloc();
  // constructor, forward to Parent InheritedWidget
  Provider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget _) {
    // Todo implantation
    return true;
  }

  static FormBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }
}
