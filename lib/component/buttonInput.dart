import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonInput extends StatelessWidget {
  final String text;
  final void Function()? press;
  const ButtonInput({
    required this.press,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0XFF2B637B)),
        minimumSize: const MaterialStatePropertyAll(Size(double.infinity, 50)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
