import 'package:flutter/material.dart';
import 'manage_outages.dart';
import 'manage_users.dart';
import 'manage_news.dart';
import 'admin_login_page.dart'; 

class AdminHomePage extends StatelessWidget {
  final String username;

  AdminHomePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40), // Space for status bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Admin Dashboard',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.logout, color: Colors.white),
                      onPressed: () {
                        _showLogoutConfirmationDialog(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Welcome, $username!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  _buildAdminOptionButton(
                    context,
                    Icons.people,
                    'Manage Users',
                    ManageUsersPage(),
                  ),
                  SizedBox(height: 20),
                  _buildAdminOptionButton(
                    context,
                    Icons.power,
                    'Manage Outages',
                    ManageOutagesPage(),
                  ),
                  SizedBox(height: 20),
                  _buildAdminOptionButton(
                    context,
                    Icons.article,
                    'Manage News',
                    ManageNewsPage(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdminOptionButton(BuildContext context, IconData icon, String text, Widget page) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 40), // Larger button with more padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Rounded corners
        ),
        backgroundColor: Color.fromARGB(255, 233, 233, 233),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Row(
        children: [
          Icon(icon, size: 28, color: Color.fromARGB(255, 61, 179, 37)),
          SizedBox(width: 20), // More space between icon and text
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 23), // Larger text size
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => AdminLoginPage()),
                ); // Navigate to admin login page
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
