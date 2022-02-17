import 'package:covid19_tracker/home.dart';
import 'package:covid19_tracker/states.dart';
import 'package:flutter/material.dart';

//
//https://webhooks.mongodb-stitch.com/api/client/v2.0/app/covid-19-qppza/service/REST-API/incoming_webhook/global?country=India&min_date=2022-02-05T00:00:00.000Z&max_date=2022-02-05T00:00:00.000Z&hide_fields=_id,%20country,%20country_code,%20country_iso2,%20country_iso3,%20loc,%20state,%20uid

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff022b3a),
        appBar: AppBar(
          title: Text(
            "COVID-19 Tracker",
          ),
        ),
        body: Home()
      )
    );
  }
}