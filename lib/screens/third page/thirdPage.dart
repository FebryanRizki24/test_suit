import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_suit/screens/third%20page/component/body.dart';

class ThirdPage extends StatelessWidget {
  final String name;
  const ThirdPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new),
                color: Color(0xff554AF0),
                onPressed: () {
                  Navigator.pop(context);
                }),
            centerTitle: true,
            title: Text(
              'Third Screen',
              style: GoogleFonts.poppins(
                  color: Color(0xff04021D),
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            backgroundColor: Color(0xffFFFFFF),
            elevation: 1,
            shadowColor: Colors.black),
        body: Body(name: name));
  }
}
