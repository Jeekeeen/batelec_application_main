import 'package:flutter/material.dart';

class ManageUsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Manage Users'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildUserCard('Jachin Reyes', 'Sta. Teresita'),
          _buildUserCard('John Randell Caringal', 'Taal'),
          _buildUserCard('John Claude Manalo', 'Taal'),
          _buildUserCard('Jeleen Mangubat', 'Batangas'),
          
        ],
      ),
    );
  }

  Widget _buildUserCard(String name, String location) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Icon(Icons.person)),
        title: Text(name),
        subtitle: Text(location),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }
}
