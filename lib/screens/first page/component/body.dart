import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_suit/component/buttonInput.dart';
import 'package:test_suit/component/inputField.dart';
import 'package:test_suit/screens/second%20page/secondPage.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController nameController = TextEditingController();
  TextEditingController sentenceController = TextEditingController();
  bool isPalindrome = false;

  bool checkPalindrome(String text) {
    String cleanText = text.replaceAll(' ', '').toLowerCase();
    String reversedText = cleanText.split('').reversed.join('');

    return cleanText == reversedText;
  }

  void checkIfPalindrome() {
    String inputSentence = sentenceController.text;
    setState(() {
      isPalindrome = checkPalindrome(inputSentence);
    });

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Palindrome Check'),
        content: Text(
          isPalindrome ? 'isPalindrome' : 'Not Palindrome',
          style: GoogleFonts.poppins(
              color: isPalindrome ? Colors.green : Colors.red),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          'assets/images/background.png',
          fit: BoxFit.cover,
          width: size.width,
          height: size.height,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/ic_photo.png',
              ),
              const SizedBox(
                height: 51,
              ),
              InputField(hintText: 'Name', controller: nameController),
              const SizedBox(height: 20),
              InputField(
                hintText: 'Palindrome',
                controller: sentenceController,
              ),
              const SizedBox(height: 50),
              ButtonInput(
                text: 'CHECK',
                press: () {
                  checkIfPalindrome();
                },
              ),
              const SizedBox(height: 20),
              ButtonInput(
                text: 'NEXT',
                press: () {
                  nameController.text != ''
                      ? Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                          return SecondPage(name: nameController.text);
                        }))
                      : showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'Isi dulu kolom nama',
                                style: GoogleFonts.poppins(fontSize: 16),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Ok'))
                              ],
                            );
                          },
                        );
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
