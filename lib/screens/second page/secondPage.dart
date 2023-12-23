import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_suit/screens/second%20page/component/body.dart';

class SecondPage extends StatelessWidget {
  final String name;
  final String? userName;
  const SecondPage({super.key,required this.name, this.userName});

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
              'Second Screen',
              style: GoogleFonts.poppins(
                  color: Color(0xff04021D),
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            backgroundColor: Color(0xffFFFFFF),
            elevation: 1,
            shadowColor: Colors.black),
        body: Body(name: name, userName: userName,));
  }
}
