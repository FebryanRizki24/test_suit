import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const InputField({
    required this.controller,
    required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 47,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: GoogleFonts.poppins(
                  color: const Color(0x92686777),
                )),
          ),
        ));
  }
}
