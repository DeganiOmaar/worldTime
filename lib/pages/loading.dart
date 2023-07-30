// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_app/classes/getdata-class.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  getDataLoadingPage() async {
    AllCountries oneCountry = AllCountries(
        countryName: "Africa - Tunisia",
        flag: "tunisia.png",
        link: 'Africa/Tunis');

    await oneCountry.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "time": oneCountry.timeNow,
      "location": oneCountry.timeZone,
      "isDayTime": oneCountry.isDayTime
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataLoadingPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingCircle(
              color: const Color.fromARGB(146, 12, 16, 49),
              size: 250.0,
            )

            // ElevatedButton(
            //   onPressed: () {
            //     getData();
            //   },
            //   style: ButtonStyle(
            //     backgroundColor: MaterialStateProperty.all(
            //         const Color.fromARGB(255, 48, 39, 27)),
            //     padding: MaterialStateProperty.all(EdgeInsets.all(12)),
            //     shape: MaterialStateProperty.all(RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(8))),
            //   ),
            //   child: Text(
            //     "Go To Home Screen",
            //     style: TextStyle(fontSize: 19),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
