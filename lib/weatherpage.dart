import 'package:api_calling/helpers/api_helpers.dart';
import 'package:api_calling/model_class/weather_model_class.dart';
import 'package:flutter/material.dart';

class Weatherpage extends StatefulWidget {
  const Weatherpage({Key? key}) : super(key: key);

  @override
  State<Weatherpage> createState() => _WeatherpageState();
}

class _WeatherpageState extends State<Weatherpage> {
  late Future fetchweatherdata;

  @override
  void initState() {
    super.initState();
    fetchweatherdata = ApiHelper.apiHelper.fatchweatherData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: fetchweatherdata,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            weather data = snapshot.data;
            return Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: controller,
                      onSubmitted : (val) {
                        setState(() {
                          ApiHelper.apiHelper.search2 = val;
                          print("===========================${ApiHelper.apiHelper.search2}");
                          Navigator.of(context).pushNamedAndRemoveUntil("weather_calling", (route) => false);
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: ListView(
                    padding: EdgeInsets.all(20),
                    children: [
                      Text("Country : ${data.country}"),
                      Text("City : ${data.name}"),
                      Text("Temperature : ${data.temp}"),
                      Text("Clouds : ${data.clouds}"),

                    ],
                  ),
                )
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
