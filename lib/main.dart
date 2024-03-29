import 'package:flutter/material.dart';
import 'Authentication/Auth.dart';
import 'Authentication/AuthProvider.dart';
import 'Pages/login_page.dart';
import 'Pages/rootPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: Auth(),
      child: MaterialApp(
        title: 'Flutter login demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RootPage(),
      ),
    );
  }
}
