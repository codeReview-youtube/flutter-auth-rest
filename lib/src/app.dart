import 'package:flutter/material.dart';
import 'package:login_statefull/src/providers/provider.dart';
import 'package:login_statefull/src/screens/forgot_password.dart';
import 'package:login_statefull/src/screens/login_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: "Log me in",
        home: Scaffold(
          body: LoginScreen(),
        ),
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }

  Route onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name == '/') {
      return MaterialPageRoute(
        builder: (_) => LoginScreen(),
      );
    }
    if (routeSettings.name == '/forgot_password') {
      return MaterialPageRoute(
        builder: (_) => ForgotPassword(),
      );
    }
    return MaterialPageRoute(
      builder: (_) => LoginScreen(),
    );
  }
}
