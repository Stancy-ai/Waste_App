// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'home.dart';

class MyLocation extends StatefulWidget {
  const MyLocation({Key? key, this.username}) : super(key: key);
  final String? username;

  @override
  State<MyLocation> createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  String? selectedValue;
  final _dropdownFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            color: Color.fromRGBO(27, 51, 51, 1),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 40, 16, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Color.fromRGBO(0, 204, 255, 1),
                    radius: 20,
                    child: Text(
                      widget.username!.substring(0, 1),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        '${widget.username}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _dropdownFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 15,
                      ),
                      child: Text(
                        "Where are you located?",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            filled: true,
                            fillColor: Colors.grey,
                            hintText: 'E.g Tema',
                          ),
                          validator: (value) {
                            return null;
                          },
                          // value == null ? "Select your location" : null

                          dropdownColor: Colors.white,
                          value: selectedValue,
                          onChanged: (String? newValue) {
                            // setState(() {
                            //   selectedValue = newValue!;
                            // });
                          },
                          items: dropdownItems),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        'OR',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    // Link to location data//

                    GetLocation(),

                    SizedBox(
                      height: 250,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                           

                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: Text("Success"),
                                  content: Text(
                                      "Your request has been sent, an agent will call you shortly."),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                      },
                                      child: Text("Ok"),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Container(
                              width: 500,
                              height: 55,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(27, 51, 51, 1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(
        child: Text(
          "Tema",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        value: "Tema"),
    DropdownMenuItem(
        child: Text(
          "Lapaz - Tema Station",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        value: "TLapaz - Tema Station"),
    DropdownMenuItem(
        child: Text(
          "Tema Station",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        value: "Tema Station"),
    DropdownMenuItem(
        child: Text(
          "Passport Office Tema Station",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        value: "Passport Office Tema Station"),
    DropdownMenuItem(
        child: Text(
          "Accra New Tema Station",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        value: "Accra New Tema Station"),
    DropdownMenuItem(
        child: Text(
          "Tema Station Lorry Station, Kotobabi",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        value: "Tema Station Lorry Station, Kotobabi"),
  ];
  return menuItems;
}
