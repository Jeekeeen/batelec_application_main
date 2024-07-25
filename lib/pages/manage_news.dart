import 'package:flutter/material.dart';

class ManageNewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Manage News'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildNewsItem(context, 'assets/images/power_outage.jpg', 'News 1 Title'),
            SizedBox(height: 20),
            _buildNewsItem(context, 'assets/images/batelec1logowhitejpg', 'News 2 Title'),
            SizedBox(height: 20),
            _buildNewsItem(context, 'assets/images/billing-history.jpg', 'News 3 Title'),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsItem(BuildContext context, String imagePath, String title) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Image.asset(imagePath, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // Placeholder for Add action
                },
                icon: Icon(Icons.add),
                label: Text('Add'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // Placeholder for Delete action
                },
                icon: Icon(Icons.delete),
                label: Text('Delete'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
