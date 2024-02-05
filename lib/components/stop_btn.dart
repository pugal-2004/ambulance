import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
              _insertClickEvent("stop");
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
Future<void> 
_insertClickEvent(String labelText)async{
  CollectionReference sevierity = FirebaseFirestore.instance.collection("clicks");
  //get current timestamp
  final Timestamp= DateTime.now().toLocal().toString();

   //get the user name
  String?_emailController=FirebaseAuth.instance.currentUser?.email;

  //Insert data in firestore
  await sevierity.add({
    "timestamp": Timestamp,
    "labelText":labelText,
    "email":_emailController,

   
    
  });
}