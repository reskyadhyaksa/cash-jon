import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math';

Future new_dompet(String dompet) async {
  final email = FirebaseAuth.instance.currentUser!.email;
  final newDompet = {'dompet': dompet};

  Random random = Random();
  int randomNumber = random.nextInt(100);
  String new_code = 'CJ' + '$dompet' + randomNumber.toString();
  await FirebaseFirestore.instance
      .collection('users/$email/dompet')
      .doc(new_code)
      .set(newDompet);
}
