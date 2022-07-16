// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ApprovedRequest extends StatefulWidget {
  const ApprovedRequest({Key? key}) : super(key: key);

  @override
  State<ApprovedRequest> createState() => _ApprovedRequestState();
}

class _ApprovedRequestState extends State<ApprovedRequest> {
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
          // ignore: prefer_const_literals_to_create_immutables
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
              backgroundColor: Colors.green,
              radius: 12,
              child: Icon(
                Icons.done_rounded,
                size: 15,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                ),
                child: Text(
                  '''Waste agent has accepted your                                                                                          request and on their way''',
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
              child: GestureDetector(
                onTap: () {
                  // if (_dropdownFormKey.currentState!.validate()) {
                  //   //valid flow
                  // }
                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => FailedRequest(),
                  //     ),
                  //     (route) => false);
                },
                child: Center(
                  child: Text(
                    'Cancel request',
                    style: TextStyle(
                      color: Colors.black,
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
    );
  }
}
