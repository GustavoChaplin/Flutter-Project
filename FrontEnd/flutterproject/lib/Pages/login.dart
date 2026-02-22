import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

@override
  State<LoginPage> createState() => _LoginPage();
  
}
class _LoginPage extends State<LoginPage>{
  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: { "#": RegExp(r'[0-9]') },
  );
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      body: Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
    colors: [
        Color.fromARGB(255, 0, 0, 0),
        Color(0xFF2B1240),
        Color(0xFF3C1A59),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
      ),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 2,
          constraints: BoxConstraints(maxWidth: 1020,maxHeight: 550),
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 80, 37, 102),
                Color.fromARGB(255, 69, 15, 101),
                Color.fromARGB(255, 54, 35, 68),
              ],
            ),
            borderRadius: BorderRadius.circular(16), 
             boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
          ),
          child: Form(
            key:_formKey,
            child: Row(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                      image: DecorationImage(
                        image: AssetImage('lib/assets/loginIMG.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        SizedBox(height: 50),

                        // CPF
                        TextFormField(
                          cursorColor: const Color.fromARGB(255, 255, 255, 255),
                          keyboardType: TextInputType.number,
                          inputFormatters: [cpfFormatter],
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white
                            ),
                          decoration: InputDecoration(
                            labelText: 'CPF',
                            labelStyle: TextStyle(
                              color: const Color.fromARGB(255, 255, 255, 255)
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 0, 0, 0)
                              )
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 255, 255, 255)
                              )
                            )
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty){
                              return 'Insert your CPF';
                            }
                            else if (cpfFormatter.getUnmaskedText().length < 11){
                              return 'Insert a valid CPF';
                            }
                            /*else if (value!=userState){
                              return 'CPF not registered';
                            }*/
                            return null;
                          },
                        ),

                        SizedBox(height: 32),

                        // PASSWORD
                        TextFormField(
                          cursorColor: const Color.fromARGB(255, 255, 255, 255),
                          obscureText: true,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white
                          ),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: const Color.fromARGB(255, 255, 255, 255)
                            ),
                            border: OutlineInputBorder(
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 255, 255, 255)
                              )
                            )
                          ),
                          validator: (value){
                            if (value == null || value.trim().isEmpty){
                              return 'Insert a Password';
                            }
                            return null;
                          }
                        ),

                        SizedBox(height: 50),
                        
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()){}
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFE6E2D9),
                              foregroundColor: Color.fromARGB(255, 0, 0, 0),
                              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 46),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              textStyle: TextStyle(
                                fontSize: 17
                              )
                            ),
                            child: Text('Sign in'),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Center(
                        child: TextButton(
                          onPressed: () {
                          },
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white70,
                              ),
                              children: [
                                TextSpan(text: "Don't have an account? "),
                                TextSpan(
                                  text: "Register",
                                  style: TextStyle(
                                    color: Color(0xFFE6E2D9),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}