import 'package:flutter/material.dart';
import 'package:project/auth/auth_service.dart';


import 'package:project/pages/mt_button.dart';

import '../components/my_textfield.dart';

class LoginPage extends StatelessWidget {

  //email and password controller
  final TextEditingController _emailController=TextEditingController();
final TextEditingController _passwordController=TextEditingController();
 
 // tap to register page
final void Function()? onTap;


 LoginPage({super.key, required this.onTap});
 //login
 void login(BuildContext context)async{
//Auth Service
  final authService = AuthService();

  //try login 
  try{
    await authService.signInWithEmailPasssword(_emailController.text, _passwordController.text);

  }
  //catch error
  catch(e){
    
    showDialog(context: context, builder: (context)=>AlertDialog(
      title: Text(e.toString()),
    ),);

  }

  


 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      
      body: Center(
        child: Column(
          
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            //logo
            Icon(
              Icons.drive_eta_outlined,
              size: 60,
              color:Theme.of(context).colorScheme.primary,
            ),
            const SizedBox( height: 20,),
            //Welcome 
            Text(
              "Welcome Rider",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
              ),
            ),
            const SizedBox( height: 25,),
            

            
            //email TextField
            MyTextField(hintText: "Email",
            obscureText: false,
            controller: _emailController,
            ),

            const SizedBox( height: 25,),

            //pswd TextField
            MyTextField(hintText: "password",
            obscureText: true,
            controller: _passwordController ,
            ),

           const SizedBox(height: 25,),


            //login btn
            MyButton(
              text: "Login",
              onTap: ()=> login(context),
            ),
            const SizedBox(height: 25,),

            //Not a member
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Not a member? "),
                GestureDetector(
                  onTap: onTap,
                  child: Text("Register Now",
                  style: TextStyle(fontWeight: FontWeight.bold,
                  color: Colors.blue
                  ),
                  ),
                ),
              ],
            )

         
        
        
        
        
        
        
        
        
          ],
        ),
      ),
    );
  }
}