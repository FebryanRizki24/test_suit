import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_suit/component/buttonInput.dart';
import 'package:test_suit/screens/third%20page/thirdPage.dart';

class Body extends StatelessWidget {
  final String name;
  final String? userName;
  const Body({super.key, required this.name, this.userName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: GoogleFonts.poppins(fontSize: 12),
              ),
              Text(
                name,
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Center(
            child: Text(userName ?? 'Selected User Name',
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.w600)),
          ),
          ButtonInput(
            text: 'Choose a User',
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ThirdPage(name: name);
              }));
            },
          )
        ],
      ),
    );
  }
}
