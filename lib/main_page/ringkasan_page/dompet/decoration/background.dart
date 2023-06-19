import 'package:flutter/material.dart';

//! ********** BACKGROUND BOTTOM ********** !//
Widget background_dompet_bottom() {
  return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
              image: AssetImage('assets/icon/dompet_background1.png'),
              scale: 4,
              alignment: Alignment.bottomLeft)));
}

// ! ********** BACKGROUND TOP ********** !//
Widget background_dompet_top(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
            image: AssetImage('assets/icon/dompet_background2.png'),
            scale: 3.5,
            alignment: Alignment.topRight)),
  );
}
