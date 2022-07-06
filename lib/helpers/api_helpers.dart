import 'dart:convert';

import 'package:api_calling/model_class/image_model_class.dart';
import 'package:api_calling/model_class/weather_model_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;






TextEditingController controller = TextEditingController();

class ApiHelper {
  ApiHelper._api();

  static final ApiHelper apiHelper = ApiHelper._api();


  String API1 = "https://pixabay.com/api/?key=27308827-9268e5beff4ba21fea66400ae&q=yellow%20flower&image_type=photo&pretty=true&per_page=%2050";
  String API_Key1 = "27308827-9268e5beff4ba21fea66400ae";
  String search1 = "yellow%20flower";
  String imageType1 = "photo";
  Future fatchImagesData() async {

    http.Response res = await http.get(Uri.parse(API1));

    Map data = jsonDecode(res.body);

    List alldata = data['hits'];

    List response = alldata.map((e) => ImageModel.fromJSON(e)).toList();

    return response;
  }

  String API_Key2 = "5a51e520b27305c63a0b4fb5a655d426";
  String search2 = "surat";


  Future fatchweatherData() async {
    String API2= "https://api.openweathermap.org/data/2.5/weather?q=$search2&appid=5a51e520b27305c63a0b4fb5a655d426";


    http.Response res = await http.get(Uri.parse(API2));
    if(res.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(res.body);

      weather Weather = weather.FromJSON(data);
    return Weather;
    }else{
      return null;
    }

  }
}
