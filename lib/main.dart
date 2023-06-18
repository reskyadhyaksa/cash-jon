// import 'package:cash_jon/entry_page/_signup_page.dart';
import 'package:cash_jon/backend/check_user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'backend/firebase_options.dart';

void main() async {
  //Binding into Firebase API
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const cash_jon());
}

class cash_jon extends StatelessWidget {
  const cash_jon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CASHJON',
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
