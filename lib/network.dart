import 'dart:convert';
import 'package:http/http.dart' as http;

class Network{

  Network(this.url);
  final String url;

  Future<dynamic> getStats() async {
    var stats = Uri.parse(this.url);

    var res = await http.get(stats);
    if(res.statusCode == 200) {
      var data = jsonDecode(res.body);
      return data["data"]["regional"];
    } else
      {
        print(res.statusCode);
      }
  }

  Future<dynamic> totalConfirmed() async {
    var stats = Uri.parse(this.url);

    var res = await http.get(stats);
    if(res.statusCode == 200) {
      var data = jsonDecode(res.body);
      return data["data"]["summary"];
    }
  }

}

//data.regional
//data.regional[0].loc