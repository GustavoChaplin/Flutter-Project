import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutterproject/Requests/UserRequest.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterPage extends StatefulWidget {
 const RegisterPage({super.key});

@override
  State<RegisterPage> createState() => _RegisterPageState();
  
}

class _RegisterPageState extends State<RegisterPage>{
    final cpfFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: { "#": RegExp(r'[0-9]') },
    );
    final UserService userService = UserService();
    final TextEditingController _userNameController = TextEditingController();
    final TextEditingController _surNameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _cpfController = TextEditingController();
    final TextEditingController _userPasswordController = TextEditingController();
    String? selectedUserType;
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
            constraints: BoxConstraints(maxWidth: 1020,maxHeight: 710,minHeight: 630),
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
                    child:Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        SizedBox(height: 13),
                        TextFormField(
                          cursorColor: const Color.fromARGB(255, 255, 255, 255),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                          ),
                          decoration: InputDecoration(
                            labelText: 'First Name',
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
                          validator: (value) {
                            if (value == null || value.trim().isEmpty){
                              return 'Insert your First Name';
                            }
                            return null;
                          },
                          controller: _userNameController,
                        ),
                        SizedBox(height: 12,),
                          TextFormField(
                          cursorColor: const Color.fromARGB(255, 255, 255, 255),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                          ),
                          decoration: InputDecoration(
                            labelText: 'Last Name',
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
                          validator: (value) {
                            if (value == null || value.trim().isEmpty){
                              return 'Insert your last Name';
                            }
                            return null;
                          },
                          controller: _surNameController,
                        ),
                        SizedBox(height: 12,),

                          
                          TextFormField(
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(fontSize: 16, color: Colors.white),
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Insert your e-mail';
                              }

                              final regex = RegExp(r'^[\w\.-]+@(gmail\.com|outlook\.com)$');

                              if (!regex.hasMatch(value)) {
                                return 'Use only @gmail.com or @outlook.com';
                              }

                              return null;
                            },
                            controller: _emailController,
                          ),
                        SizedBox(height: 12,),
                        TextFormField(
                          cursorColor: const Color.fromARGB(255, 255, 255, 255),
                          keyboardType: TextInputType.number,
                          inputFormatters: [cpfFormatter],
                          style: TextStyle(
                            fontSize: 16,
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
                            return null;
                          },
                          controller: _cpfController,
                        ),
                        SizedBox(height: 12),
                        // PASSWORD
                        TextFormField(
                          cursorColor: const Color.fromARGB(255, 255, 255, 255),
                          obscureText: true,
                          style: TextStyle(
                            fontSize: 16,
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
                          validator: (value) {
                            if (value == null || value.trim().isEmpty){
                              return 'Insert your PassWord';
                            }
                            return null;
                          },
                          controller: _userPasswordController,
                        ),
                        SizedBox(height: 12,),
                          DropdownButtonFormField<String>(
                            isExpanded: true,
                            initialValue: selectedUserType,
                            dropdownColor: Color(0xFF3C1A59),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Gender',
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            items: [
                              DropdownMenuItem(value: 'M', child: Text('Male')),
                              DropdownMenuItem(value: 'F', child: Text('Female')),
                            ],
                            onChanged: (value) {
                              selectedUserType = value;
                            },
                            validator: (value) {
                              if (value == null || value.trim().isEmpty){
                                return 'Choose your gender';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              selectedUserType = value;
                            },
                          ),
                        SizedBox(height: 20),
                        
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Processing Data')),
                                );

                                var unformattedCpf = _cpfController.text.replaceAll('.', '').replaceAll('-', '');
                                
                                userService.registerUser(_userNameController.text, _surNameController.text, _emailController.text, unformattedCpf, _userPasswordController.text, selectedUserType!)
                                .then((value) => {
                                  if (value != null) {
                                    FlutterSecureStorage().write(key: 'token', value: value.token),
                                    context.go('/login')
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Invalid Data')),
                                    )
                                  }
                                });
                              }

                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(222, 47),
                              backgroundColor: Color(0xFFE6E2D9),
                              foregroundColor: Color.fromARGB(255, 0, 0, 0),
                              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 35),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              textStyle: TextStyle(
                                fontSize: 17
                              )
                            ),
                            child: Text('Register'),
                          ),
                        ),
                        SizedBox(height: 5,),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              context.go('/login');
                            },
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white70,
                                ),
                                children: [
                                  TextSpan(text: "Already have an account? "),
                                  TextSpan(
                                    text: "Sign In",
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
                )
                ),
              ],
            ),
          ),
        ),
        ),
      );
    }
}
