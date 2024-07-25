import 'package:flutter/material.dart';
import 'admin_home_page.dart';
import 'login_page.dart'; // Import your customer login page

class AdminLoginPage extends StatefulWidget {
  @override
  _AdminLoginPageState createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  // Hardcoded admin credentials for demonstration
  final String adminUsername = "admin";
  final String adminPassword = "jake123";

  bool _validateAdmin(String input, String password) {
    return input == adminUsername && password == adminPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/batelec1logowhite.jpg'),
                  SizedBox(height: 10),
                  Text(
                    'Admin Portal',
                    style: TextStyle(
                      color: Colors.green[700],
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(height: 30),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          controller: usernameController,
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black.withOpacity(0.2),
                            labelText: 'Admin Username',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person, color: Colors.green[700]),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: passwordController,
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black.withOpacity(0.2),
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock, color: Colors.green[700]),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText ? Icons.visibility : Icons.visibility_off,
                                color: Colors.green[700],
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                          obscureText: _obscureText,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[700],
                            foregroundColor: Colors.white,
                            minimumSize: Size(double.maxFinite, 50),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              String input = usernameController.text;
                              String password = passwordController.text;
                              if (_validateAdmin(input, password)) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AdminHomePage(username: input),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Invalid username or password.')),
                                );
                              }
                            }
                          },
                          child: Text('Login'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage(registeredUsers: [])), // Replace with actual data
                );
              },
              child: Text(
                'Customer',
                style: TextStyle(
                  color: const Color.fromARGB(255, 58, 58, 58).withOpacity(0.25), // Less visible text
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
