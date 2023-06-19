import 'dart:ui';

import 'package:cash_jon/main_page/ringkasan_page/dompet/decoration/background.dart';
import 'package:cash_jon/main_page/ringkasan_page/dompet/decoration/button_dompet.dart';
import 'package:cash_jon/main_page/ringkasan_page/dompet/decoration/text_tambah.dart';
import 'package:flutter/material.dart';

class tambah_dompet extends StatelessWidget {
  const tambah_dompet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          insetPadding: EdgeInsets.fromLTRB(15, 180, 15, 0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF2A2F4F),
            ),
            child: Stack(children: [
              background_dompet_bottom(),
              background_dompet_top(context),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text_tambah(),
                  SizedBox(height: 20),
                  input_dompet(context),
                  submit_dompet_button(context)
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
