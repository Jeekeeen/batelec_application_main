import 'package:flutter/material.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  final List<Map<String, String>> registeredUsers;

  RegisterPage({required this.registeredUsers});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController houseNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _registerUser(String email, String fullName, String password, String houseNumber) {
    widget.registeredUsers.add({
      'email': email,
      'fullName': fullName,
      'password': password,
      'houseNumber': houseNumber
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/batelecbuildingblur.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/batelec1logowhite.jpg'),
                Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.green[700],
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: fullNameController,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person, color: Colors.green[700]),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: emailController,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email, color: Colors.green[700]),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          } else if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: houseNumberController,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          labelText: 'House Number',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.house, color: Colors.green[700]),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a house number';
                          } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return 'House number should only contain numbers';
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
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock, color: Colors.green[700]),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
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
                            _registerUser(emailController.text, fullNameController.text, passwordController.text, houseNumberController.text);
                            Navigator.pop(context); // Go back to the login page
                          }
                        },
                        child: Text('Sign Up'),
                      ),
                      SizedBox(),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(registeredUsers: widget.registeredUsers),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Already have an account? Login',
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
      ),
    );
  }
}
