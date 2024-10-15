import 'package:flutter/material.dart';
import 'package:football_app/competition.dart';
import 'package:football_app/players_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: 
        Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Image.asset('assets/football.png',height: 500,),
              
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  GestureDetector(
                    onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>PlayersScreen(),),);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 9
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Football Players',
                        style: TextStyle(color: Colors.white, fontSize: 18),),),),
                    
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Competition(),),);
                    },
                    child: Container(
                    padding: const EdgeInsets.symmetric(vertical:15,horizontal:9),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Competitions',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),),],
             
              ),
            ],
          ),
        ),
      ),
    );}}
 
