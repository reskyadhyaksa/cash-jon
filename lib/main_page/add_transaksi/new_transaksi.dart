import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future new_transaksi(String dompet, String jenis_transaksi, String deskripsi,
    int nominal, String tanggal, String waktu) async {
  final nowEmail = FirebaseAuth.instance.currentUser!.email;
  final newTransaksi = {
    'jenis_bank': dompet.replaceAll('bank ', ''),
    'jenis_transaksi': jenis_transaksi,
    'deskripsi': deskripsi,
    'nominal': nominal,
    'tanggal': tanggal,
    'waktu': waktu,
  };

  print(nowEmail);
  Random random = Random();
  int randomNumber = random.nextInt(100);
  String replace = tanggal.replaceAll(r'/', '');
  String potongTanggal = replace.substring(0, 8);
  String new_code = 'CJ' + potongTanggal + randomNumber.toString();

  await FirebaseFirestore.instance
      .collection('users/$nowEmail/catatan')
      .doc(new_code)
      .set(newTransaksi);
}
