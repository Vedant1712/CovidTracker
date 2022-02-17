import 'dart:core';
import 'package:flutter/material.dart';
import 'package:covid19_tracker/network.dart';
import 'states.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

  String total = "";
  String discharged = "";
  String deaths = "";

  @override
  void initState() {
    super.initState();
    overallData();
  }

  void overallData() async {
    var totalcases = await Network('https://api.rootnet.in/covid19-in/stats/latest').totalConfirmed();

    setState(() {
      total = totalcases["total"].toString();
      discharged = totalcases["discharged"].toString();
      deaths = totalcases["deaths"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Cards(gradient: [Colors.cyan, Colors.cyan.shade100], text: 'Total Cases', color: Colors.cyan.shade800, value: total),
        Cards(gradient: [Colors.amber, Colors.amber.shade100], text: 'Discharged', color: Colors.amber.shade800, value: discharged),
        Cards(gradient: [Colors.lightGreen, Colors.lightGreen.shade100], text: 'Deaths', color: Colors.lightGreen.shade800, value: deaths),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.red, Colors.red.shade100]
              ),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: EdgeInsets.all(10.0),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => States()));
              },
              child: Text(
                'CLICK ME',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.red.shade900
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class Cards extends StatelessWidget {
  const Cards({Key? key, required this.gradient, required this.text, required this.color, required this.value}) : super(key: key);

  final List<Color>gradient;
  final String text;
  final Color color;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Container(
        width: 350,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: gradient
            ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: color
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 50.0,
                color: color
              ),
            )
          ],
        ),
      ),
    );
  }
}

