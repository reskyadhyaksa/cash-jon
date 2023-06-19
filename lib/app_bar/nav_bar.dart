import 'package:cash_jon/app_bar/count_saldo.dart';
import 'package:cash_jon/main_page/ringkasan_page/ringkasan_page.dart';
import 'package:cash_jon/main_page/transaksi_page/_transaksi_page.dart';
import 'package:cash_jon/main_page/add_transaksi/add_transaksi.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main_page/akun_page/akun_page.dart';
import 'package:flutter/material.dart';

class bottom_nav_bar extends StatefulWidget {
  const bottom_nav_bar({super.key});

  @override
  State<bottom_nav_bar> createState() => _bottom_nav_barState();
}

class _bottom_nav_barState extends State<bottom_nav_bar> {
  int selected_index = 0;
  bool secure_saldo = false;
  int jumlah_saldo_now = 1234000;
  final screen_list = [ringkasan_page(), akun_page(), transaksi_page()];

  CollectionReference current_user =
      FirebaseFirestore.instance.collection('users');

  FloatingActionButtonLocation button_location =
      FloatingActionButtonLocation.endDocked;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //! CLEAR ALL AND TERMINATE ALL PERSIST / CACHE
    FirebaseFirestore.instance.terminate();
    FirebaseFirestore.instance.clearPersistence();
  }

  //! AFTER CLEARING PERSISTANT REDECLARATE THE CURRENT USER TO GAIN USERNAME
  // final currentUser = FirebaseAuth.instance.currentUser!;
  // final user_reloaded = FirebaseAuth.instance.currentUser!.reload();
  final displayName = FirebaseAuth.instance.currentUser!.displayName.toString();
  final emailUser = FirebaseAuth.instance.currentUser!.email.toString();

  @override
  Widget build(BuildContext context) {
    //! ******* CUSTOM BOTTOM NAV BAR ******* !//
    Widget Bottom_App_Bar() {
      return BottomAppBar(
          height: 65,
          shape: CircularNotchedRectangle(),
          color: Color(0xFF2A2F4F),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 17),
                child: GestureDetector(
                    child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    setState(() {
                      print(displayName);
                      this.selected_index = 0;
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 2),
                      Container(
                        child: Image.asset(
                          'assets/icon/ringkasan_icon.png',
                          scale: 5,
                        ),
                      ),
                      Text('Ringkasan',
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w700))
                    ],
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 10),
                child: GestureDetector(
                    child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    setState(() {
                      this.selected_index = 2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 2),
                      Container(
                        child: Image.asset(
                          'assets/icon/transaksi_icon.png',
                          scale: 5,
                        ),
                      ),
                      Text('Transaksi',
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w700))
                    ],
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: GestureDetector(
                    child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  radius: 100,
                  onTap: () {
                    setState(() {
                      selected_index = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 2),
                      Container(
                        child:
                            Image.asset('assets/icon/akun_icon.png', scale: 5),
                      ),
                      const SizedBox(height: 2, width: 75),
                      Text('Akun',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w700))
                    ],
                  ),
                )),
              ),
            ],
          ));
    }

    //! ******* TITLE TEXT ******* !//
    Widget title_text() {
      return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 55),
            child: Row(
              children: [
                Text('Hello, ${displayName}',
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Jumlah Saldo',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
                Row(
                  children: [
                    secure_saldo == true
                        ? count_saldo()
                        : Text('Rp *************',
                            style: GoogleFonts.poppins(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w700)),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          secure_saldo = !secure_saldo;
                        });
                      },
                      icon: Icon(secure_saldo
                          ? Icons.remove_red_eye
                          : Icons.visibility_off),
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(125),
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users/$emailUser/catatan')
                  .snapshots(),
              builder: (context, snapshot) {
                return Stack(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(10)),
                    child: Image.asset(
                      'assets/img/background1.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.only(top: 55, right: 25),
                      child: Image.asset(
                        'assets/img/logo_cashjon.png',
                        scale: 4,
                      ),
                    ),
                  ),
                  title_text(),
                ]);
              })),
      floatingActionButton: SizedBox(
        height: 75,
        width: 75,
        child: FloatingActionButton.small(
            backgroundColor: Color(0xFFFDE2F3),
            onPressed: () {
              print(emailUser);
              showDialog(
                  context: context, builder: (builder) => add_transaksi());
            },
            tooltip: 'Tambah Transaksi',
            child: const Icon(
              Icons.add,
              color: Colors.black,
              size: 30,
            )),
      ),
      body: Stack(
          children: screen_list
              .asMap()
              .map((i, screen) => MapEntry(
                  i, Offstage(offstage: selected_index != i, child: screen)))
              .values
              .toList()),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: Bottom_App_Bar(),
    );
  }
}
