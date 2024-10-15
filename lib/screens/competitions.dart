import 'package:flutter/material.dart';
import 'package:football_app/screens/comdetails.dart';
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
      Uri.parse('http://api.football-data.org/v4/competitions'),headers:{'X-Auth-Token': '261f345f1716447cae3b21de6e327cab', 
      },
    );
    final data = json.decode(response.body);
      setState(() {
        competitions = data['competitions']; 
        filteredCompetitions = competitions; 
      });
    
  } void _filterCompetitions(String query) {
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
            padding: EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterCompetitions, 
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),),),
           
          Expanded(
            child: filteredCompetitions.isEmpty? Center(child: CircularProgressIndicator()) 
                : ListView.builder(
                    itemCount: filteredCompetitions.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(filteredCompetitions[index]['name']),
                        onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>CompetitionDetail(competition: filteredCompetitions[index],))
                           
                            
                            
                          );
                        }, );
                     
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

