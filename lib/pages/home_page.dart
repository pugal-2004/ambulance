
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:project/auth/auth_service.dart';

import 'package:project/components/my_drawer.dart';
import 'package:project/components/sevierity_btn.dart';



// ignore: must_be_immutable
class  HomePage extends StatelessWidget {
HomePage({super.key});

  void logout(){
    final _auth = AuthService();
    _auth.signOut();

  }
User?userId = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      
    actions: [
      //logout button
      IconButton(onPressed: logout, icon: const Icon(Icons.logout))
    ],
  
    ),
    
    drawer: MyDrawer(),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
        Image.asset("assests/flutter1.jpg",
        width: 180,
        ),
        SizedBox(height: 10,),
        
        
        //Text
        Text(
              "Welcome Driver",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox( height: 25,),
        
        //strt button
        ElevatedButton(
        onPressed: () {
          
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => const  condition()));
       
        }, 
        style: ElevatedButton.styleFrom(
          primary:Colors.deepPurple ,
          minimumSize: Size(200, 60),

        ),
        
        child: const Text("start",
        style: TextStyle(color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24.0
        ),
        ),
        ),
      ],),
    
      
      
       
     ),
    );
  }
}