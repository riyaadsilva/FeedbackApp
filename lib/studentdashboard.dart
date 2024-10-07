import 'package:feedback_app/dashboardbutton.dart';
import 'package:feedback_app/profilepage.dart';
import 'package:flutter/material.dart';

class Studentdashboard extends StatelessWidget {
  final Color customcolor1 = const Color(0xff2e73ae);
  final Color customcolor2 = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Student Dashboard',
          style: TextStyle(
            color: customcolor2,
          ),
        ),
        centerTitle: false,
        backgroundColor: customcolor1,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Container(
              width: 500,
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 30,
                children: [
                  DashboardButton(
                    label: 'give Feedback',
                    icon: Icons.note_alt,
                    color: customcolor1,
                    onPressed: () {
                      // Add functionality here
                    },
                  ),
                  
                  DashboardButton(
                      label: 'Profile',
                      icon: Icons.person,
                      color: customcolor1,
                      onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()),
                        );}),
                  
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}