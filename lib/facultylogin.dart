import 'package:feedback_app/appwriteprovider.dart';
import 'package:feedback_app/buttons.dart';
import 'package:feedback_app/facultydashboard.dart';
import 'package:feedback_app/hoddashboard.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FacultyLoginPage extends StatelessWidget {
  final int deptidf;
  final String fRole;
  final String dnamef;
  final AppwriteService as = AppwriteService();

  FacultyLoginPage({
    required this.deptidf,
    required this.fRole,
    required this.dnamef,
  }); //Received role and dept from FacultyDepartmentPage

  final TextEditingController fusernameController = TextEditingController();
  final TextEditingController fpasswordController = TextEditingController();
  bool _obscureText = true; // Variable to control password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xEBFFFFFF),
      appBar: AppBar(
        title: Text(
          'Faculty Login',
          style: TextStyle(
            color: Colors.white, // Set the text color to white
          ),
        ),
        centerTitle: false, // Align the title to the left
        backgroundColor: Color(0xff2e73ae),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 40),
            // Account Icon
            Icon(
              Icons.account_circle, // Built-in Flutter icon
              size: 150, // Adjust the size as needed
              color: Color(0xff2e73ae), // Match the app bar color
            ),
            SizedBox(height: 40),
            // Username TextField
            TextField(
              controller: fusernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 20),
            // Password TextField with Eye Icon
            StatefulBuilder(
              builder: (context, setState) {
                return TextField(
                  controller: fpasswordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 40),
            Buttons(
              text: 'Login',
              onPressed: () async {
                final String userName = fusernameController.text;
                final String passWord = fpasswordController.text;

                String prefix = userName.substring(0, 3);
                if (prefix == 'HOD') {
                  final isValid = await as.verifyUserCredentialsF(
                    userName,
                    passWord,
                    deptidf,
                    fRole,
                  ); // Verifying if all entered data has an exact match in the database

                  if (isValid) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Logged in Successfully')),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HodDashboard(
                          hodDusername: userName,
                          hosDID: deptidf,
                          dnameFDashboard: dnamef,
                          frole: fRole,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text('Invalid username or password or Role')),
                    );
                  }
                } else {
                  final isValid = await as.verifyUserCredentialsF(
                    userName,
                    passWord,
                    deptidf,
                    fRole,
                  ); // Verifying if all entered data has an exact match in the database

                  if (isValid) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Logged in Successfully')),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FacultyDashboard(
                          f1username: userName,
                          f1userRole: fRole,
                          dnameFDashboard: dnamef,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text('Invalid username or password or Role')),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
