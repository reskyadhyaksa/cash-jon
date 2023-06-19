import 'package:cash_jon/main_page/ringkasan_page/dompet/dompet_area.dart';
import 'package:cash_jon/main_page/ringkasan_page/last_transaksi/last_transaksi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ringkasan_page extends StatefulWidget {
  ringkasan_page({super.key});

  @override
  State<ringkasan_page> createState() => _ringkasan_pageState();
}

class _ringkasan_pageState extends State<ringkasan_page> {
  //! ******* METHOD JUMLAH SALDO ******* !//
  void jumlah_saldo() {}

  @override
  Widget build(BuildContext context) {
    //? MAKE APP BAR TRANSPARENT AND FIT WITH NOTIF BAR
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return const Scaffold(
        // resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Stack(children: [
            Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                    children: [const dompet_field(), const transaksi_area()]))
          ]),
        ));
  }
}
