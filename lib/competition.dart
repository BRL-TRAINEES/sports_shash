import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Competition extends StatefulWidget {
  @override
  _CompetitionState createState() => _CompetitionState();
}

class _CompetitionState extends State<Competition> {
  List competitions = []; 
  List filteredCompetitions = []; 
  String searchQuery = ""; 

  @override
  void initState() {
    super.initState();
    fetchCompetitions();
  }

  Future<void> fetchCompetitions() async {
    final response = await http.get(
      Uri.parse('http://api.football-data.org/v4/competitions'),
      headers: {
        'X-Auth-Token': '261f345f1716447cae3b21de6e327cab', 
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        competitions = data['competitions']; 
        filteredCompetitions = competitions; 
      });
    } else {
      throw Exception('Failed to load competitions');
    }
  }

  void _filterCompetitions(String query) {
    setState(() {
      searchQuery = query;
      filteredCompetitions = competitions.where((competition) {
        return competition['name']
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            competition['area']['name']
                .toLowerCase()
                .contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Competitions'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterCompetitions, // Call filter function on input change
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: filteredCompetitions.isEmpty
                ? Center(child: CircularProgressIndicator()) // Show loading indicator
                : ListView.builder(
                    itemCount: filteredCompetitions.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(filteredCompetitions[index]['name']), // Display competition name
                        onTap: () {
                          // Navigate to competition details
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CompetitionDetail(
                                competition: filteredCompetitions[index],
                              ),
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

class CompetitionDetail extends StatelessWidget {
  final dynamic competition; // Accept competition data

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
    String winnerLogo = competition['currentSeason']['winner'] != null
        ? competition['currentSeason']['winner']['crest']
        : '';

    return Scaffold(
      appBar: AppBar(
        title: Text(competition['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (emblemUrl.isNotEmpty)
              Image.network(
                emblemUrl,
                width: 100,
                height: 100,
              ),
            SizedBox(height: 10),
            Text(
              'Competition Name: ${competition['name']}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Area: $areaName',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Current Season: $currentSeasonStartDate - $currentSeasonEndDate',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Current Winner: $winnerName',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            if (winnerLogo.isNotEmpty)
              Image.network(
                winnerLogo,
                width: 100,
                height: 100,
              ),
            SizedBox(height: 20),
            // You can add more details here as needed
          ],
        ),
      ),
    );
  }
}
