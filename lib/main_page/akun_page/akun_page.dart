import 'package:cash_jon/main_page/akun_page/logout_button.dart';
import 'package:flutter/material.dart';

class akun_page extends StatelessWidget {
  const akun_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [logout_button(context)],
        ),
      ),
    );
  }
}
