import 'package:flutter/material.dart';

class StopBtn extends StatefulWidget {
  const StopBtn({super.key});

  @override
  State<StopBtn> createState() => _StopBtnState();
}

class _StopBtnState extends State<StopBtn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(onPressed: (){
              Navigator.popUntil(context,(Route)=>Route.isFirst);
            },
             style: ElevatedButton.styleFrom(
              primary:Colors.amber,
          minimumSize: Size(200, 60),
             ),
             
            child: Text("STOP",style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),),
            
            
            ),
          ),
        ],
      ),
    );
  }
}