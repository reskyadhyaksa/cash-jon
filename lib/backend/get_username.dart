// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class get_username extends StatelessWidget {
//   final String documentID;

//   get_username({required this.documentID});

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users_db =
//         FirebaseFirestore.instance.collection('users');

//     return FutureBuilder(
//       future: users_db.doc(documentID).get(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           Map data = snapshot.data!.data() as Map;
//           return Text(data['username'].toString(),
//               style: GoogleFonts.poppins(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.white));
//         }
//         return Text('',
//             style: GoogleFonts.poppins(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.white));
//       },
//     );
//   }
// }

// Future<String> get_only_username(String documentPath, String fieldName) async {
//   try {
//     DocumentSnapshot snapshot =
//         await FirebaseFirestore.instance.doc(documentPath).get();
//     if (snapshot.exists) {
//       return snapshot.get(fieldName).toString();
//     } else {
//       return 'Document does not exist';
//     }
//   } catch (e) {
//     return 'Error retrieving data : $e';
//   }
// }
