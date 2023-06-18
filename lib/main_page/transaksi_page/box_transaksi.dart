import 'package:cash_jon/main_page/transaksi_page/get_pemasukan.dart';
import 'package:cash_jon/main_page/transaksi_page/get_pengeluaran.dart';
import 'package:flutter/material.dart';

Widget box_transaksi(BuildContext context, bool jenis_trans) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    height: MediaQuery.of(context).size.height * 0.45,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Color(0xFF5C469C)),
    child: jenis_trans ? get_pemasukan() : get_pengeluaran(),
  );
}
