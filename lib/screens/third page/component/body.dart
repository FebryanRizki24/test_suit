import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:test_suit/screens/second%20page/secondPage.dart';

class Body extends StatefulWidget {
  final String name;
  const Body({Key? key, required this.name}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late List<Map<String, dynamic>> userList;
  int page = 1;
  bool isLoading = false;
  String selectedUserName = '';
  bool isEmpty = false;

  @override
  void initState() {
    super.initState();
    userList = [];
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    final response = await http
        .get(Uri.parse('https://reqres.in/api/users?page=$page&per_page=10'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> users = data['data'];

      setState(() {
        userList.addAll(users.cast<Map<String, dynamic>>());
        isLoading = false;
        isEmpty = userList.isEmpty;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> refreshData() async {
    userList.clear();
    page = 1;
    await fetchData();
  }

  bool _onNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
        if (!isLoading) {
          page++;
          fetchData();
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refreshData,
      child: NotificationListener<ScrollNotification>(
        onNotification: _onNotification,
        child: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            final user = userList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      setState(() {
                        selectedUserName =
                            '${user['first_name']} ${user['last_name']}';
                        print('Selected User: $selectedUserName');
                      });
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return SecondPage(
                            name: widget.name, userName: selectedUserName);
                      }));
                    },
                    leading: ClipOval(child: Image.network(user['avatar'])),
                    title: Text(
                      '${user['first_name']} ${user['last_name']}',
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      user['email'],
                      style: GoogleFonts.poppins(
                          fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Divider()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
