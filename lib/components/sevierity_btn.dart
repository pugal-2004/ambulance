import 'package:flutter/material.dart';
import 'package:project/components/stop_btn.dart';


class condition extends StatelessWidget {
  const condition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('enter the type of consequence'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  
                  Navigator.push(context, MaterialPageRoute(
          builder: (builder)=>const StopBtn()
          
        ));
                  
                },
                 style: ElevatedButton.styleFrom(
          primary:Colors.red ,
          minimumSize: Size(200, 60),

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
                  Navigator.push(context, MaterialPageRoute(
          builder: (builder)=>const StopBtn()
          
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
                  Navigator.push(context, MaterialPageRoute(
          builder: (builder)=>const StopBtn()));
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