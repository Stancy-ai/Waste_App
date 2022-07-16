// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:waste_management/dashboard/confirmation.dart';

import 'approved_request.dart';

class FailedRequest extends StatefulWidget {
  const FailedRequest({Key? key}) : super(key: key);

  @override
  State<FailedRequest> createState() => _FailedRequestState();
}

class _FailedRequestState extends State<FailedRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(27, 51, 51, 1),
        leading: CircleAvatar(
          backgroundColor: Color.fromRGBO(0, 204, 255, 1),
          child: Text(
            'S',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Column(
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
              'Stancy',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 40,
              ),
              child: Text(
                "Your location",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Text(
              "Passport Office Tema Station",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              backgroundColor: Colors.red,
              radius: 12,
              child: Icon(
                Icons.close_rounded,
                size: 15,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 110,
                ),
                child: Text(
                  '''Sorry. Waste agent has                                                                                           rejected your request''',
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
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
                      onTap: () {
                        // if (_dropdownFormKey.currentState!.validate()) {
                        //   //valid flow
                        //   GetLocation();
                        // }
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Confirmation(),
                            ),
                            (route) => false);
                      },
                      child: Center(
                        child: Text(
                          'Submit new request',
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
    );
  }
}
