import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/components/stop_btn.dart';


class condition extends StatelessWidget {
  const condition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
       
        ),
        body: Center(
        
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
             const Padding(padding:EdgeInsets.all(16.0),
             child: Align(
              alignment: Alignment.centerLeft,
              child: Text("click the situation:-",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,

              ),
              textAlign: TextAlign.left,
              ),
             ), 
             ),
             const SizedBox(height: 30,),
              ElevatedButton(
                onPressed: () {
                  _insertClickEvent("red");
                  
                  Navigator.push(context, MaterialPageRoute(
          builder: (builder)=> StopBtn()
          
        ));
                  
                },
                 style: ElevatedButton.styleFrom(
          primary:Colors.red ,
          minimumSize: const Size(200, 60),

        ),
                child: const Text('High',
                style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0
                ),
                
                
                ),
              ),
              const SizedBox(height: 16), 
              ElevatedButton(
                onPressed: () {
                  _insertClickEvent("yellow");
                  Navigator.push(context, MaterialPageRoute(
          builder: (builder)=> StopBtn()
          
        ));

                },
                 style: ElevatedButton.styleFrom(
          primary:Colors.yellow ,
          minimumSize: Size(200, 60),

        ),
                child: const Text('Moderate',
                 style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0
                ),
                ),
              ),
              const SizedBox(height: 16), 
              ElevatedButton(
                onPressed: () {
                  _insertClickEvent("green");
                  Navigator.push(context, MaterialPageRoute(
          builder: (builder)=>StopBtn()));
                },
                 style: ElevatedButton.styleFrom(
          primary:Colors.green,
          minimumSize: Size(200, 60),

        ),
                child: const Text('basic',
                 style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0
                ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
Future<void> 
_insertClickEvent(String color)async{
  CollectionReference sevierity = FirebaseFirestore.instance.collection("clicks");
  //get current timestamp
  final Timestamp= DateTime.now().toLocal().toString();

  
   //get the user name
  String?_emailController=FirebaseAuth.instance.currentUser?.email;

  //Insert data in firestore
  await sevierity.add({
    "timestamp": Timestamp,
     "color": color,
     "email":_emailController,

  });
}
