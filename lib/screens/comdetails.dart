import 'package:flutter/material.dart';

class CompetitionDetail extends StatelessWidget {
  final dynamic competition;

  CompetitionDetail({required this.competition});

  @override
  Widget build(BuildContext context) {
    String areaName = competition['area']['name'] ?? 'N/A';
    String emblemUrl = competition['emblem'] ?? '';
    String currentSeasonStartDate = competition['currentSeason']['startDate'] ?? 'N/A';
    String currentSeasonEndDate = competition['currentSeason']['endDate'] ?? 'N/A';
    String winnerName = competition['currentSeason']['winner'] != null
        ? competition['currentSeason']['winner']['name']
        : 'N/A';
return Scaffold(
      appBar: AppBar(
        title:Text(competition['name']),
      ),
      body: Container(
        color: Colors.blueGrey,
        padding: const EdgeInsets.all(13.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              
                  Image.network(emblemUrl,width: 300,
                    height: 200,),
             
              SizedBox(height: 20),
              Text('Competition Name: ${competition['name']}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text('Area: $areaName',
                style: TextStyle(fontSize: 16, color: Colors.white), 
              ),
              SizedBox(height: 10),
              Text('Current Season: $currentSeasonStartDate - $currentSeasonEndDate',
                style: TextStyle(fontSize: 16, color: Colors.white), 
              ),
              SizedBox(height: 10),
              Text('Current Winner: $winnerName',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
