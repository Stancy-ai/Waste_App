// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:waste_management/dashboard/home.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _click = true;
  bool _passwordvisible = true;
  String? username, password, email, password2;
bool _isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(27, 51, 51, 1),
        title: Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Username',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            username = value;
                          },
                          validator: (String? value) {
                            if (value == null || value.trim().length == 0) {
                              return "Field is required!";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Enter username',
                            fillColor: Colors.grey[200],
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                 Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            email = value;
                          },
                          validator: (String? value) {
                            if (value == null || value.trim().length == 0) {
                              return "Field is required!";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Enter username',
                            fillColor: Colors.grey[200],
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: _passwordvisible ? true : false,
                          onChanged: (value) {
                            password = value;
                          },
                          validator: (String? value) {
                            if (value == null || value.trim().length == 0) {
                              return "Field is required!";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Enter password',
                            fillColor: Colors.grey[200],
                            filled: true,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _click = !_click;
                                  _passwordvisible = !_passwordvisible;
                                });
                              },
                              child: Icon(
                                (_click == true)
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                 SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Confirm password',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: _passwordvisible ? true : false,
                          onChanged: (value) {
                            password2 = value;
                          },
                          validator: (String? value) {
                            if (value == null || value.trim().length == 0) {
                              return "Field is required!";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Enter password',
                            fillColor: Colors.grey[200],
                            filled: true,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _click = !_click;
                                  _passwordvisible = !_passwordvisible;
                                });
                              },
                              child: Icon(
                                (_click == true)
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 500,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(27, 51, 51, 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: GestureDetector(
                            onTap: ()async {
                              if (_formkey.currentState != null &&
                                  _formkey.currentState!.validate()){

                                 final usernameData=await signUp(username: username, email:email, password1:password, password2
                                 : password2);
                              if (usernameData==null)return;
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                    builder: (context) => GetLocation(username:usernameData),
                                  ),
                                   );
                            }},
                            child: Center(
                              child: _isloading?CircularProgressIndicator(): Text(
                                'Sign up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                        (route) => false);
                  },
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                            text: 'Already have an account?',
                            style: TextStyle(
                              color: Colors.black,
                              // fontSize: 13,
                            ),
                            children: [
                              TextSpan(
                                text: '  Click here',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<String?> signUp ({String? username,String? email, String? password1, String? password2})async{
   var url = Uri.parse('https://shrouded-cove-67243.herokuapp.com/dj-rest-auth/registration/');
    //var url = 'https://shrouded-cove-67243.herokuapp.com/dj-rest-auth/registration/';
    setState(() {
      _isloading=true;
      
    });
    try {
    var response = await http.post(url, headers: {'Content-Type': 'application/json'}, body:jsonEncode( {
    "username": "$username",
    //"email": "$email",
    "password1": "$password1",
    "password2": "$password2"
}));
setState(() {
  _isloading=false;
});
print(response.statusCode);
if ( response.statusCode ==201){
  final data=jsonDecode(response.body);
  return data['user']['username'];
}return null;


     
    } catch (e) {
      setState(() {
        _isloading=false;
      });
      print(e);
      return null;
   
}

  }
}
