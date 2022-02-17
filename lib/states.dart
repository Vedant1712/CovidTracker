import 'network.dart';
import 'package:flutter/material.dart';
import 'dart:math';

List<String>states = ["Andaman and Nicobar Islands","Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar","Chandigarh",
  "Chhattisgarh","Dadra and Nagar Haveli and Daman and Diu","Delhi", "Goa","Gujarat","Haryana","Himachal Pradesh","Jammu and Kashmir","Jharkhand",
  "Karnataka","Kerala","Ladakh","Lakshadweep","Madhya Pradesh","Maharashtra","Manipur","Meghalaya","Mizoram","Nagaland","Odisha","Puducherry","Punjab",
  "Rajasthan","Sikkim","Tamil Nadu","Telangana","Tripura","Uttarakhand" ,"Uttar Pradesh", "West Bengal"];

List<Color>colors = [Colors.lightBlueAccent, Colors.red, Colors.orange, Colors.green, Colors.cyan,
  Colors.purple, Colors.lime, Colors.teal, Colors.blueAccent, Colors.deepPurple];

List totalCases = [];
List<Widget> child = [];

class States extends StatefulWidget {
  const States({Key? key}) : super(key: key);

  @override
  _StatesState createState() => _StatesState();
}

class _StatesState extends State<States> {

  @override
  void initState() {
    super.initState();
    initSetup();
  }

  void initSetup () async {
    await getStatesData();

  }


  Future getStatesData() async {
    var statesData = await Network('https://api.rootnet.in/covid19-in/stats/latest').getStats();

    for(var i = 0; i < statesData.length; i++) {
      totalCases.add(statesData[i]["totalConfirmed"]);
    }
    await getList();
    setState(() {

    });
  }

  Future<void> getList() async {
    for(var j = 0; j < states.length; j++) {
      var element = colors[Random().nextInt(colors.length)];
      setState(() {
        child.add(StateName(text: states[j], data: totalCases[j].toString(), xyz: element));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: child
    );
  }
}

class StateName extends StatelessWidget {
  const StateName({Key? key, required this.text, required this.data, required this.xyz}) : super(key: key);

  final String text;
  final String data;
  final Color xyz;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      color: xyz,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 190.0,
            child: Text(
              text,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  fontSize: 30.0,
                  color: Colors.white
              ),
            ),
          ),
          Container(
            child: Text(
              data,
              style: const TextStyle(
                  fontSize: 30.0,
                  color: Colors.white
              ),
            ),
          )
        ],
      ),
    );
  }
}