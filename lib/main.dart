import 'package:dashboard_1/base.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login_page/auth.dart';
import 'package:flutter/material.dart';
import 'login_page/login_register_page.dart';
import './dashboard/home.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WidgetTree(),
  ));
}

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Main();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
