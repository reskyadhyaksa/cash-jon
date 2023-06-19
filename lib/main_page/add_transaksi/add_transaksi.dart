import 'package:cash_jon/main_page/add_transaksi/empty_popup.dart';
import 'package:cash_jon/main_page/add_transaksi/format24hour.dart';
import 'package:cash_jon/main_page/add_transaksi/new_transaksi.dart';
import 'package:cash_jon/main_page/add_transaksi/transaksi_popup.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui';

class add_transaksi extends StatefulWidget {
  const add_transaksi({super.key});

  @override
  State<add_transaksi> createState() => _add_transaksiState();
}

class _add_transaksiState extends State<add_transaksi> {
  //  ********** VARIABLE DECLARATION ********** !//
  bool pemasukan = true;
  bool pengeluaran = false;
  String formattedTime = '';
  bool displayMessage = false;
  bool time_have_been_pick = true;
  DateTime date_now = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  TimePickerEntryMode initial_mode = TimePickerEntryMode.inputOnly;
  final new_saldo_mask = MoneyMaskedTextController(leftSymbol: 'Rp. ');
  final TextEditingController deskripsi_controller = TextEditingController();
  final TextEditingController bank_controller = TextEditingController();

  //! ********** BACKGROUND BOTTOM ********** !//
  Widget background_add_bottom() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
                image: AssetImage('assets/img/background_add_transaksi2.png'),
                scale: 4,
                alignment: Alignment.bottomLeft)));
  }

  // ! ********** BACKGROUND TOP ********** !//
  Widget background_add_top(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
              image: AssetImage('assets/img/background_add_transaksi1.png'),
              alignment: Alignment.topRight)),
    );
  }

  //! ********** TEKS TAMBAH TRANSAKSI  ********** !//
  Widget teks_tambah_transaksi() {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 20, bottom: 20),
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          'Tambah Transaksi',
          style: GoogleFonts.poppins(
              fontSize: 17, color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  //! ********** TEKS JENIS TRANSAKSI  ********** !//
  Widget teks_jenis_transaksi() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: 145,
        child: Text('Jenis Transaksi :',
            style: GoogleFonts.poppins(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.w700)),
      ),
    );
  }

  //! ********** TEKS DESKRIPSI  ********** !//
  Widget teks_deskripsi() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 7),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('Deskripsi                :',
            style: GoogleFonts.poppins(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.w700)),
      ),
    );
  }

//! ********** TEXT NOMINAL ********** !//
  Widget text_nominal() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 7),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('Nominal                  :',
            style: GoogleFonts.poppins(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.w700)),
      ),
    );
  }

//! ********** INPUT TEXT DESKRIPSI ********** !//
  Widget input_teks_deskripsi() {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7), color: Color(0xFFD9D9D9)),
      child: TextField(
          textInputAction: TextInputAction.next,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onEditingComplete: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          controller: deskripsi_controller,
          maxLines: 4,
          decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              hintText: 'Masukkan Deskripsi',
              hintStyle: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w500),
              border: InputBorder.none),
          style: GoogleFonts.poppins(
              fontSize: 16,
              color: Color(0xFF2A2F4F),
              fontWeight: FontWeight.w700)),
    );
  }

//! ********** INPUT TEXT NOMINAL ********** !//
  Widget input_teks_nominal() {
    return Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Color(0xFFD9D9D9)),
        child: TextField(
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            onEditingComplete: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            controller: new_saldo_mask,
            decoration: InputDecoration(
              // errorText: _errorText,
              border: InputBorder.none,
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              hintText: 'Masukkan Nominal',
              hintStyle: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w500),
            ),
            style: GoogleFonts.poppins(
                fontSize: 16,
                color: Color(0xFF2A2F4F),
                fontWeight: FontWeight.w700)));
  }

//! ********** BUTTON BACK  ********** !//
  Widget button_back() {
    return Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Container(
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 30)),
        ));
  }

//! ********** BUTTON SUMBIT ********** !//
  Widget submit_button() {
    // String format24hours = get24hourformat(hour, minute);
    return Padding(
      padding: EdgeInsets.zero,
      child: Align(
        alignment: Alignment.bottomRight,
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7))),
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => Color(0xFFD9D9D9))),
          onPressed: () {
            if (pemasukan == true &&
                deskripsi_controller.text != "" &&
                new_saldo_mask.text != "") {
              new_transaksi(
                  bank_controller.text,
                  'pemasukan',
                  deskripsi_controller.text,
                  new_saldo_mask.numberValue.toInt(),
                  DateFormat('dd/MM/yyyy').format(date_now),
                  time_have_been_pick
                      ? get24hourformat(
                          TimeOfDay.now().hour, TimeOfDay.now().minute)
                      : formattedTime);
              Navigator.pop(context);
              pemasukan_pop_up(context);
            } else if (pemasukan == false &&
                deskripsi_controller.text != "" &&
                new_saldo_mask.text != "") {
              new_transaksi(
                  bank_controller.text.toUpperCase(),
                  'pengeluaran',
                  deskripsi_controller.text,
                  new_saldo_mask.numberValue.toInt(),
                  DateFormat('dd/MM/yyyy').format(date_now),
                  time_have_been_pick
                      ? get24hourformat(
                          TimeOfDay.now().hour, TimeOfDay.now().minute)
                      : formattedTime);
              Navigator.pop(context);
              pengeluaran_pop_up(context);
            } else {
              print(new_saldo_mask.numberValue.toInt());
              Navigator.pop(context);
              empty_pop_up(context);
            }
          },
          child: Text('Simpan',
              style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2A2F4F))),
        ),
      ),
    );
  }

  //! ********** BUTTON JENIS PENGELUARAN  ********** !//
  Widget button_jenis_pengeluaran() {
    return Row(
      children: [
        //! ##### BUTTON PENGELUARAN #### !//
        IconButton(
          padding: EdgeInsets.only(left: 0),
          constraints: BoxConstraints(),
          onPressed: () {
            setState(() {
              pemasukan = !pemasukan;
              pengeluaran = false;
              print('Pemasukan : $pemasukan | Pengeluaran : $pengeluaran');
            });
          },
          icon: Icon(pemasukan ? Icons.circle : Icons.circle),
          color: pemasukan == true && pengeluaran == false
              ? Colors.white
              : Colors.grey,
          iconSize: 22,
        ),
        SizedBox(width: 10),
        TextButton(
          style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor: Color(0xFF917FB3),
              foregroundColor: Color(0xFF917FB3),
              padding: EdgeInsets.zero),
          onPressed: () {
            setState(() {
              pemasukan = !pemasukan;
              pengeluaran = false;
            });
          },
          child: Text('Pemasukan',
              style: GoogleFonts.poppins(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w700)),
        ),

        //! ##### BUTTON PENGELUARAN #### !//
        IconButton(
          padding: EdgeInsets.only(left: 18),
          constraints: BoxConstraints(),
          onPressed: () {
            setState(() {
              pengeluaran = !pengeluaran;
              pemasukan = false;
              print('Pemasukan : $pemasukan | Pengeluaran : $pengeluaran');
            });
          },
          icon: Icon(pengeluaran ? Icons.circle : Icons.circle),
          color: pengeluaran == true && pemasukan == false
              ? Colors.white
              : Colors.grey,
          iconSize: 22,
        ),
        SizedBox(width: 10),
        TextButton(
          style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor: Color(0xFF917FB3),
              foregroundColor: Color(0xFF917FB3),
              padding: EdgeInsets.zero),
          onPressed: () {
            setState(() {
              pengeluaran = !pengeluaran;
              pemasukan = false;
            });
          },
          child: Text('Pengeluaran',
              style: GoogleFonts.poppins(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w700)),
        ),
      ],
    );
  }

  //! ********** ROW DATE AND TIME PICK  ********** !//
  Widget row_dateTime(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [get_time(), SizedBox(width: 5), get_date()],
      ),
    );
  }

  //! ********** GET DATE  ********** !//
  Widget get_date() {
    return GestureDetector(
      onTap: () {
        showDatePicker(
                context: context,
                initialDate: date_now,
                firstDate: DateTime(2022),
                lastDate: DateTime.now())
            .then((value) {
          setState(() {
            value == null ? date_now = DateTime.now() : date_now = value;
          });
        });
      },
      child: Container(
          padding: const EdgeInsets.only(left: 8, top: 5, bottom: 5, right: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Color(0xFFD9D9D9)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                DateFormat('dd/MM/yyyy').format(date_now),
                style: GoogleFonts.poppins(
                    color: Color(0xFF2A2F4F),
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
              const Icon(
                Icons.calendar_month,
                color: Color(0xFF2A2F4F),
                size: 20,
              ),
            ],
          )),
    );
  }

  //! ********** GET TIME  ********** !//
  Widget get_time() {
    // String format24hours = get24hourformat(hour, minute);
    return GestureDetector(
      onTap: () {
        showTimePicker(
          context: context,
          initialEntryMode: TimePickerEntryMode.input,
          initialTime: TimeOfDay.now(),
          builder: (context, child) {
            return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: false),
                child: child!);
          },
        ).then((value) {
          value == null ? selectedTime = TimeOfDay.now() : selectedTime = value;

          final hour_now = selectedTime.hour;
          final minute_now = selectedTime.minute;

          final formattedTime_ = get24hourformat(hour_now, minute_now);

          setState(() {
            time_have_been_pick = !time_have_been_pick;
            this.formattedTime = formattedTime_;
          });
        });
      },
      child: Container(
          padding: EdgeInsets.only(right: 5, top: 5, bottom: 5, left: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Color(0xFFD9D9D9)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                time_have_been_pick
                    ? get24hourformat(
                        TimeOfDay.now().hour, TimeOfDay.now().minute)
                    : formattedTime,
                style: GoogleFonts.poppins(
                    color: Color(0xFF2A2F4F),
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
              Icon(
                Icons.timer,
                color: Color(0xFF2A2F4F),
                size: 20,
              ),
            ],
          )),
    );
  }

  //! ********** MAIN PROGRAM  ********** !//
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Dialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.fromLTRB(15, 180, 15, 0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                height: 520,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF917FB3),
                ),
                child: Stack(
                  children: [
                    background_add_top(context),
                    background_add_bottom(),
                    button_back(),
                    teks_tambah_transaksi(),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 80),
                      child: Column(
                        children: [
                          teks_jenis_transaksi(),
                          button_jenis_pengeluaran(),
                          teks_deskripsi(),
                          input_teks_deskripsi(),
                          text_nominal(),
                          input_teks_nominal(),
                          row_dateTime(context),
                          submit_button(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
