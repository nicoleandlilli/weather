import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/location.dart';
// import 'package:http/http.dart';
import 'package:http/http.dart' as http;

const apiKey = '060757cdb30dcabea549a48fd235dbaa';

class LoadingScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoadingScreenState();


}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState(){
    getLocation();
  }
  Future<void> getLocation() async{
      try {
        final position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        print(position);
      }catch(e){
        print('the exception is $e');
      }
  }






  // Future<void> getLocation() async {
  //   // try {
  //   //   final position = await Geolocator.getCurrentPosition(
  //   //       desiredAccuracy: LocationAccuracy.high);
  //   //   print(position);
  //   // }catch(e){
  //   //   print('the exception is $e');
  //   // }
  //
  //   Location location =  Location();
  //   await location.getCurrentLocation();
  //
  //   print('latitude........${location.latitude} ..........longitude.........${location.longitude}');
  //
  // }

  void getData() async {
    var url = 'https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=$apiKey';

    // Response response = await get(Uri.parse(url));
    http.Response response = await http.get(Uri.parse(url));


    if(response.statusCode == 200){
      String data = response.body;
      print('statusCode = ${data}');

      // var longitute = jsonDecode(data)['coord']['lon'];
      double longitute = jsonDecode(data)['coord']['lon'];
      print('longitute = ${longitute}');

      // var description = jsonDecode(data)['weather'][0]['description'];
      String description = jsonDecode(data)['weather'][0]['description'];
      print('description = ${description}');
    }else{
      print('statusCode = ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    String myMargin = '15';
    double myMarginAsDouble;
    try {
      myMarginAsDouble = double.parse(myMargin);
    }catch(e){
      print('the exception is $e');
      myMarginAsDouble = 30.0;

    }

    return Scaffold(
      body: Center(

        child:
        // RaisedButton(
        ElevatedButton(
          onPressed: () {
          // getLocation();
            getData();
        },
          child: Text('Get Location'),

        ),
      ),

      // body: Container(
      //   margin: EdgeInsets.all(myMarginAsDouble),
      //   color: Colors.red,
      // ),
    );
  }

}