import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class StopBtn extends StatefulWidget {
  final String _phoneNumber = "+917299770222";

  StopBtn({Key? key}) : super(key: key);
  

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
            child: ElevatedButton(
              onPressed: () {
                _insertClickEvent("stop");
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                minimumSize: Size(200, 60),
              ),
              child: Text(
                "STOP",
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final _call = 'tel:${widget._phoneNumber}';
          if (await canLaunch(_call)) {
            await launch(_call);
          } else {
            throw 'Could not launch $_call';
          }
        
        },
        backgroundColor: Colors.red,
        shape: CircleBorder(side: BorderSide(width: 1)),
        elevation: 4,
        highlightElevation: 8,
        child: const Text("SOS",
        style: TextStyle(fontSize: 18,
        ),
        ),
      ),
    );
  }
}

Future<void> _insertClickEvent(String labelText) async {
  CollectionReference severity = FirebaseFirestore.instance.collection("clicks");
  // get current timestamp
  final timestampValue = DateTime.now().toLocal().toString();

  //get current location of driver
  Position position = await _getCurrentLocation();

  // get the user name
  String? emailController = FirebaseAuth.instance.currentUser?.email;

  // Insert data in firestore
  await severity.add({
    "timestamp": timestampValue,
    "labelText": labelText,
    "email": emailController,
    "latidude":position.latitude,
    "logitude":position.longitude,
  });
}
Future<Position> _getCurrentLocation() async{
  return await 
  Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
}