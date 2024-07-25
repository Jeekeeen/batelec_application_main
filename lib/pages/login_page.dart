import 'package:flutter/material.dart';
import 'admin_login_page.dart'; // Import your AdminLoginPage
import 'customer_home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  final List<Map<String, String>> registeredUsers;

  LoginPage({required this.registeredUsers});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  bool _validateUser(String input, String password) {
    for (var user in widget.registeredUsers) {
      if ((user['username'] == input || user['houseNumber'] == input) && user['password'] == password) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/batelecbuildingblur.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.03),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Text(
                      'BATELEC Go!',
                      style: TextStyle(
                        color: Colors.green[700],
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
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
                            fillColor: Colors.white.withOpacity(0.1),
                            labelText: 'Username or House Number',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.house_outlined, color: Colors.green[700]),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username or house number';
                            } else if (value.length >= 20) {
                              return 'Username or house number must be less than or at most 20 characters long';
                            } else if (!RegExp(r'^[a-zA-Z0-9#.,-]+$').hasMatch(value)) {
                              return 'Username or house number should only contain letters, numbers, spaces, and special characters';
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
                            fillColor: Colors.white.withOpacity(0.1),
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
                              if (_validateUser(input, password)) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CustomerHomePage(username: input),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Invalid username, house number, or password. Please try again or sign up.')),
                                );
                              }
                            }
                          },
                          child: Text('Login'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RegisterPage(registeredUsers: widget.registeredUsers)),
                            );
                          },
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              'Don\'t have an account? Sign up',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.green[700]),
                            ),
                          ),
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
                  MaterialPageRoute(builder: (context) => AdminLoginPage()),
                );
              },
              child: Text(
                'Admin',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.25), // Less visible text
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
