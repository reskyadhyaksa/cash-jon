// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';

// Widget get_tanggal() {
//   String get_date = '';
//   final email = FirebaseAuth.instance.currentUser!.email;

//   return StreamBuilder(
//     stream: FirebaseFirestore.instance
//         .collection('users/$email/catatan')
//         .snapshots(),
//     builder: (context, snapshot) {
//       if (!snapshot.hasData) {
//         return Text('Rp *************',
//             style: GoogleFonts.poppins(
//                 fontSize: 22,
//                 color: Colors.white,
//                 fontWeight: FontWeight.w700));
//       } else {
//         List? list_data = snapshot.data!.docs.map((e) => e.data()).toList();
//         for (int i = 0; i < list_data.length; i++) {
//           DateTime parseDate =
//               DateFormat('dd/MM/yyyy').parse(list_data[i]['tanggal']);
//           get_date = parseDate.toString();
//         }
//         return Text(get_date.toString(),
//             style: GoogleFonts.poppins(
//                 fontSize: 17,
//                 color: Color(0xFF2A2F4F),
//                 fontWeight: FontWeight.w700));
//       }
//     },
//   );
// }
