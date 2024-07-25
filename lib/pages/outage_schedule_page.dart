import 'package:flutter/material.dart';

class OutageSchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.green, // Replace with the color used on the customer home page
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
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Expanded(
                      child: Center(
                      child: Text(
                        'Outage Schedule',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    height: 400, // Adjust height as needed for the image
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/power_outage.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(''),
                          ),
                          title: Text('J. Reyes'),
                          subtitle: Text('Umayos kayo nag vavalo ako e pawala wala ang koryente.'),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(''),
                          ),
                          title: Text('J.R Caringal'),
                          subtitle: Text('Wala nanaman koryente? mag dadabog ako!'),
                        ),
                        
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(''),
                          ),
                          title: Text('J.C Manalo'),
                          subtitle: Text('T*ng*na niyong lahat, pano bebe time namin.'),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(''),
                          ),
                          title: Text('J. Mangubat'),
                          subtitle: Text('Hays'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Add a comment...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Placeholder for sending a comment
                    },
                    child: Text('Send'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
