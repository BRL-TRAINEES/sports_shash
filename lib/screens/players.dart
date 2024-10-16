import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:football_app/screens/playersdetails.dart';
import 'package:http/http.dart' as http;

import '../apikey.dart';

class PlayersScreen extends StatefulWidget {
  @override
  _PlayersScreenState createState() => _PlayersScreenState();
}
class _PlayersScreenState extends State<PlayersScreen> {
  List players = [];
  List filteredPlayers = [];
  bool isLoading = true;
  String errorMessage = '';
  
   @override
  void initState() {
    super.initState();
    fetchPlayers();
  }
  Future<void> fetchPlayers() async {
    try {
      final response = await http.get(
        Uri.parse('https://v3.football.api-sports.io/players/profiles'),headers: {'x-apisports-key': apiKey1,},
     );
      final data = jsonDecode(response.body);
      players = data['response'] ?? []; 
     filteredPlayers=players;
      errorMessage = '';
    } catch (e) {
      errorMessage = 'Failed to load players: $e';
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
  void filterPlayers(String query) {
    final filtered = players.where((playerData) {
      final player = playerData['player']; 
      final playerName = player['name']?.toLowerCase() ?? ''; 
      return playerName.contains(query.toLowerCase());
    }).toList();
    setState(() {
      filteredPlayers = filtered;
    });
  }
  @override
Widget build(BuildContext context) {
  return Scaffold(
backgroundColor:Colors.white,
    appBar: AppBar( title: Text('Football Players'),
    ),
    body: Column(
    
      children: [
          
        Padding(
          
          padding: EdgeInsets.all(20),
          child: TextField(
            onChanged: filterPlayers,
            decoration: InputDecoration(
              hintText: 'Search players...',
              border: OutlineInputBorder(),
          prefixIcon: Icon (Icons.search, size: 35,color: const Color.fromARGB(255, 192, 138, 135),)
            ),
          ),),
        Expanded(
          child: isLoading? Center(child: CircularProgressIndicator(), ): 
                errorMessage.isNotEmpty ? Center(child: Text(errorMessage),): 
                filteredPlayers.isEmpty ? Center(child: Text('No players found.',style: TextStyle(color: Colors.white,)), 
                  
                        ):
                       ListView.builder(
                          itemCount: filteredPlayers.length, 
                          itemBuilder: (context, index) {
                            final playerData = filteredPlayers[index];
                            final player = playerData['player']; 
                            return ListTile(
                              title: Text(player['name'] ,),
                              leading: player['photo'] != null? Image.network(player['photo'], width: 50, height: 50): null,
                              onTap: () {
                                Navigator.push(context,MaterialPageRoute(builder: (context) => PlayerDetailScreen(player: player),
                                  ),
                                ); 
                              },
                            );
                          },
                        ),
        ),
      ],
    ),
  );
}
}