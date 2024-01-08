import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //logo
          DrawerHeader(child: Center(
            child: Icon(
              Icons.message_outlined,
              color: Theme.of(context).colorScheme.primary,
              size:40,
            ),

          ),
          
          )

        ],
        
      




      ),
    );
  }
}