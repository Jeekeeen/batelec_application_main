import 'package:flutter/material.dart';

class ManageOutagesPage extends StatelessWidget {
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
                          'Outage Schedule (Admin)',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
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
                  Stack(
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
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.add_a_photo, color: Colors.white),
                              onPressed: () {
                                // Placeholder for adding a photo
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.white),
                              onPressed: () {
                                // Placeholder for deleting a photo
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      children: [
                        _buildCommentTile(
                          context,
                          'A',
                          'J. Reyes',
                          'Umayos kayo nag vavalo ako e pawala wala ang koryente.',
                        ),
                        _buildCommentTile(
                          context,
                          'B',
                          'J.R Caringal',
                          'Wala nanaman koryente? mag dadabog ako!',
                        ),
                        _buildCommentTile(
                          context,
                          'C',
                          'J.C Manalo',
                          'T*ng*na niyong lahat, pano bebe time namin.',
                        ),
                        _buildCommentTile(
                          context,
                          'D',
                          'J. Mangubat',
                          'Hays',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Reply to comment...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Placeholder for sending a reply
                    },
                    child: Text('Reply'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentTile(BuildContext context, String initial, String name, String comment) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(initial),
      ),
      title: Text(name),
      subtitle: Text(comment),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.volume_off),
            onPressed: () {
              // Placeholder for muting the user
            },
          ),
          IconButton(
            icon: Icon(Icons.reply),
            onPressed: () {
              // Placeholder for replying to the comment
            },
          ),
        ],
      ),
    );
  }
}
