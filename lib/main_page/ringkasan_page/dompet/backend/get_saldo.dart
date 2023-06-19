// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// Widget get_saldo() {
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
//       }
//       return Text(' ',
//           style: GoogleFonts.poppins(
//               fontSize: 17,
//               color: Color(0xFF2A2F4F),
//               fontWeight: FontWeight.w700));
//     },
//   );
// }
