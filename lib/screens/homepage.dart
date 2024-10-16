import 'package:flutter/material.dart';
import 'package:football_app/screens/competitions.dart';
import 'players.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container( decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/screenshot.png'),
            fit: BoxFit.cover,
          ),
        ),

        child: Center(

          child:Column(
           
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(height: 300,),
             GestureDetector(
                onTap: () { Navigator.push(context,MaterialPageRoute(builder: (context) => PlayersScreen()),
                  );
                },
                child: Container(padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text('Football Players',style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 20),
              
              GestureDetector(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Competition()),
                  );
                },
                child: Container(padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
              ),
              child: Text('Compititon',style:TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))
              )
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
