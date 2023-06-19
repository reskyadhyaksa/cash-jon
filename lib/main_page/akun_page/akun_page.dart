import 'package:cash_jon/main_page/akun_page/box_akun.dart';
import 'package:cash_jon/main_page/akun_page/change_button.dart';
import 'package:cash_jon/main_page/akun_page/delete_akun.dart';
import 'package:cash_jon/main_page/akun_page/logout_button.dart';
import 'package:flutter/material.dart';

class akun_page extends StatelessWidget {
  const akun_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              box_akun(),
              SizedBox(height: 50),
              change_button(context),
              logout_button(context),
              delete_akun(context)
            ],
          ),
        ),
      ),
    );
  }
}
