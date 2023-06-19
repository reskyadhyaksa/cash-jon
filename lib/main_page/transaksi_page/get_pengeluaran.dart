import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// Widget get_pengeluaran(BuildContext context) {
//   return StreamBuilder(
//     stream:
//         FirebaseFirestore.instance.collection('users/$now_email/pengeluaran'),
//     builder: (context, snapshot) {
//       if (snapshot.hasData) {
//         return CircularProgressIndicator();
//       } else {
//         return Container()
//       }
//     },
//   );
// }

class get_pengeluaran extends StatefulWidget {
  const get_pengeluaran({super.key});

  @override
  State<get_pengeluaran> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<get_pengeluaran> {
  NumberFormat currencyFormat = NumberFormat.decimalPattern('vi_VN');
  final now_email = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users/$now_email/catatan')
          .where('jenis_transaksi', isEqualTo: 'pengeluaran')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(color: Colors.transparent);
        } else {
          return ListView(
            children: snapshot.data!.docs.map((e) {
              return Card(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                height: MediaQuery.of(context).size.height * 0.07,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            e.data()['deskripsi'].toString().length < 18
                                ? e.data()['deskripsi']
                                : e
                                        .data()['deskripsi']
                                        .toString()
                                        .substring(0, 18) +
                                    '...',
                            style: GoogleFonts.poppins(
                                fontSize: 17,
                                color: Color(0xFF2A2F4F),
                                fontWeight: FontWeight.w700)),
                        Container(
                            padding: EdgeInsets.only(
                                top: 3, bottom: 3, left: 6, right: 6),
                            decoration: BoxDecoration(
                                color: Color(0xFF2A2F4F),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                                e.data()['tanggal'] + ' : ' + e.data()['waktu'],
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)))
                      ],
                    ),
                    Spacer(),
                    Text(
                      '- Rp ' + currencyFormat.format(e.data()['nominal']),
                      style: GoogleFonts.poppins(
                          fontSize: 17,
                          color: Color(0xFFD34F4F),
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ));
            }).toList(),
          );
        }
      },
    );
  }
}
