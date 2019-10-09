import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:collection';

String link = "";

Future<List<Map<String, dynamic>>> updateList() async {
    return jsonList(await getList(link));
  }

  List<Map<String, dynamic>> jsonList(String response) {
    if (response != null) {
      List<Map<String, dynamic>> json = new List();
      for (var a in jsonDecode(response)["documents"]) {
        Map<String, dynamic> x = new HashMap();
        x["title"] = a["fields"]["title"]["stringValue"];
        x["linkImage"] = a["fields"]["linkImage"]["stringValue"];
        json.add(x);
      }
      return json;
    } else
      return null;
  }

  Future<String> getList(String link) async {
    final http.Response t = await http.get(link);
    //List<Map<String, dynamic>> json;
    if (t.statusCode == 200) {
      try {
        return t.body; //MyUtilities().jsonList(t.body);
      } catch (e) {
        print("deu bom nesse response não. E>$e");
        return null;
      }
    }
  }

  widgetConstructor(String jsonText) {
    try {
      List<dynamic> json = jsonDecode(jsonText);
      print('json size: ' + json.length.toString());
      //return Text("kk");
      return Padding(
        padding: EdgeInsets.all(2),
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: json.length,
            itemBuilder: (BuildContext context, int index) {
              Map<String, dynamic> jsoniten = json[index];
              //print(jsoniten["type"]);
              if (jsoniten["type"] == 1) //Text
              {
                //print('sera que agora vai:' + json["type"].toString());
                return new Center(
                    child: Text(jsoniten["text"].toString()));
              } else if (jsoniten["type"] == 2) //Image
                return Image.network(
                  jsoniten["text"].toString(),
                  height: 350,
                  fit: BoxFit.fitHeight,
                );
            },
          ),
        ),
      );
    } catch (e) {
      String a = e.toString();
      return Text("Foi mal, gb. Deu erro");
    }
  }