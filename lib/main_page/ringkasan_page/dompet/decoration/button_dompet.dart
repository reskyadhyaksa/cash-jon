import 'package:cash_jon/main_page/ringkasan_page/dompet/backend/new_dompet.dart';
import 'package:cash_jon/main_page/ringkasan_page/dompet/decoration/popup_dompet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextEditingController dompet_controller = TextEditingController();
final List dompet_list = ['BNI', 'BCA', 'DANA', 'SHOPEEPAY', 'MANDIRI'];

//! ********** INPUT TEXT DESKRIPSI ********** !//
Widget input_dompet(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
    child: Container(
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
          controller: dompet_controller,
          maxLines: 4,
          decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              hintText: 'Masukkan Dompet',
              hintStyle: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w500),
              border: InputBorder.none),
          style: GoogleFonts.poppins(
              fontSize: 16,
              color: Color(0xFF2A2F4F),
              fontWeight: FontWeight.w700)),
    ),
  );
}

//! ********** BUTTON SUMBIT ********** !//
Widget submit_dompet_button(BuildContext context) {
  // String format24hours = get24hourformat(hour, minute);
  return Padding(
    padding: EdgeInsets.zero,
    child: Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Color(0xFFD9D9D9))),
        onPressed: () {
          if (dompet_controller.text == '' &&
              dompet_controller.text != dompet_list) {
            Navigator.pop(context);
            invalid_dompet_pop_up(context);
          } else if (dompet_controller.text
                  .toUpperCase()
                  .replaceAll('BANK ', '') ==
              'BNI') {
            new_dompet(
                dompet_controller.text.toUpperCase().replaceAll('BANK ', ''));
            Navigator.pop(context);
            dompet_pop_up(context);
          } else if (dompet_controller.text
                  .toUpperCase()
                  .replaceAll('BANK ', '') ==
              'BCA') {
            new_dompet(
                dompet_controller.text.toUpperCase().replaceAll('BANK ', ''));
            Navigator.pop(context);
            dompet_pop_up(context);
          } else if (dompet_controller.text
                  .toUpperCase()
                  .replaceAll('BANK ', '') ==
              'MANDIRI') {
            new_dompet(
                dompet_controller.text.toUpperCase().replaceAll('BANK ', ''));
            Navigator.pop(context);
            dompet_pop_up(context);
          } else if (dompet_controller.text
                  .toUpperCase()
                  .replaceAll('BANK ', '') ==
              'DANA') {
            new_dompet(
                dompet_controller.text.toUpperCase().replaceAll('BANK ', ''));
            Navigator.pop(context);
            dompet_pop_up(context);
          } else if (dompet_controller.text
                  .toUpperCase()
                  .replaceAll('BANK ', '') ==
              'SHOPEEPAY') {
            new_dompet(
                dompet_controller.text.toUpperCase().replaceAll('BANK ', ''));
            Navigator.pop(context);
            dompet_pop_up(context);
          } else {
            Navigator.pop(context);
            error_pop_up(context);
          }
        },
        child: Text('Tambah',
            style: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2A2F4F))),
      ),
    ),
  );
}
