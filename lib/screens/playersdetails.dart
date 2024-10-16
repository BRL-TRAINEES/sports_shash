import 'package:flutter/material.dart';

class PlayerDetailScreen extends StatelessWidget {
  final Map player;

  PlayerDetailScreen({required this.player});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(player['name']),
      ),
      body: Container(
        color: Colors.blueGrey,
        padding: const EdgeInsets.all(13.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          
            Image.network(player['photo'], width: 70, height: 70) ,
            SizedBox(height: 20),
            Text('Name: ${player['name']}', style: TextStyle(fontSize: 20,color: Colors.white)),
            SizedBox(height: 8),
            Text('Position: ${player['position']??'N/A'}',style:TextStyle(fontSize: 18,color: Colors.white)),
            SizedBox(height: 8),
            Text('Nationality: ${player['nationality']??'N/A'}', style: TextStyle(fontSize: 18,color: Colors.white)),
            SizedBox(height: 8),
            Text('Age:${player['age']?.toString()??'N/A'}',style: TextStyle(fontSize: 18,color: Colors.white)),
            SizedBox(height: 8),
        ],)
        )
          
      ),
      );
    
  }
}