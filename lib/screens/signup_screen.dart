

import 'package:flutter/material.dart';
import 'package:mavazi/screens/login_screen.dart';
class SignupScreen extends StatefulWidget{
  const SignupScreen({super.key});

  @override

  State<SignupScreen> createState(){
    return _SignupScreenState();
  }
}
class _SignupScreenState extends State<SignupScreen>{
  final _signUpFormKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfController = TextEditingController();
  bool _hidePasswordConf = true;
  bool _hidePassword = true;




  @override
  Widget build(BuildContext context){
       @override
      void dispose(){
        _firstNameController.dispose();
        _lastNameController.dispose();
        _emailController.dispose();
        _passwordController.dispose();
        _passwordConfController.dispose();
      }
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: SafeArea(child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
      child: Form( key: _signUpFormKey,
      child:Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,  
        children: [
        TextFormField(
          controller: _firstNameController,
          decoration: InputDecoration(
          labelText: 'First Name',
          prefixIcon: Icon(Icons.person_2_outlined),
          border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value ==null || value.isEmpty){
              return 'Enter your first name';
            }
            return null;
          },
        ),
        const SizedBox(height:24),
        TextFormField(
          controller: _lastNameController,
          decoration: InputDecoration(
          labelText: 'Last Name',
          prefixIcon: Icon(Icons.person_2_outlined),
          border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value ==null || value.isEmpty){
              return 'Enter your last name';
            }
            return null;
          },
        ),
        const SizedBox(height:24),
        TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              labelText: 'Email',
              border:OutlineInputBorder(),
            ),
            validator: (value){
              if (value == null || value.isEmpty){
                return 'Please enter email';
              }
              if (!value.contains('@')){
                return 'Please enter a valid email address';
              }
              return null;
            }
          ),

          SizedBox( height: 24),
          TextFormField(
            controller:  _passwordController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline),
              labelText: 'Password',
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: (){ 
                  setState(() {
                _hidePassword = !_hidePassword;
                 });
              },
              icon:Icon( 
                _hidePassword
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
              ),
              ),
            ),


            
            validator: (value){
              if (value==null || value.isEmpty){
                return 'Enter your password ';
             
              }
              return null;
            },
            obscureText: _hidePassword,
          ),
       const SizedBox(height: 24),
            
          TextFormField(
            controller:  _passwordConfController, 
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_clock_outlined),
              labelText: 'Confirm Password',
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: (){ 
                  setState(() {
                _hidePasswordConf = !_hidePasswordConf; 
                 });
              },
              icon:Icon( 
                _hidePasswordConf 
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
              ),
              ),
            ),
            validator: (value){
              if (value==null || value.isEmpty){
                return 'Enter your password confirmation';
              }
              if (value != _passwordController.text){ 
                return 'Passwords do not match';
              }
              return null;
            },
            obscureText: _hidePasswordConf,
          ),
          
          const SizedBox(height: 24),
          
          ElevatedButton(
            onPressed: () {
              if (_signUpFormKey.currentState!.validate()) {
                
              }
            }, 
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child:  Text(
              "Sign Up", 
              style: TextStyle(color: Colors.white 
              ),
              
            ),
          ),
          SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  TextButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child:  Text('Login', style: TextStyle(color:Colors.blue))),
                    
                ],
              )
              ],
              
          ),
        ),
      ),
      ),
    );
    
  }
}
    