import 'package:flutter/material.dart';

class PlayerDetailScreen extends StatelessWidget {
  final Map player;

  PlayerDetailScreen({required this.player});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(player['name'] ?? 'Unknown Player'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${player['name'] ?? 'Unknown'}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text('Position: ${player['position'] ?? 'N/A'}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Nationality: ${player['nationality'] ?? 'N/A'}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Age: ${player['age']?.toString() ?? 'N/A'}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            
          ],
        ),
      ),
    );
  }
}
