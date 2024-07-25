import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final DecorationImage? image;
  final VoidCallback onPressed;

  HomeButton({
    required this.text,
    required this.icon,
    this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          image: image,
          color: Colors.white, // Background color if no image
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 40.0, color: Colors.green),
              SizedBox(height: 10.0),
              Text(text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
