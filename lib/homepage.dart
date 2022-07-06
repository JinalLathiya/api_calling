import 'package:api_calling/helpers/api_helpers.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future fetchData;

  @override
  void initState() {
    super.initState();
    fetchData = ApiHelper.apiHelper.fatchImagesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Images"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('weather_calling');
            },
          ),
        ],
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: fetchData,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List data = snapshot.data;

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                       Container(
                        margin: const EdgeInsets.all(20),
                        height: 250,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 2,
                            color: Colors.black,
                          ),
                          image: DecorationImage(
                            image: NetworkImage(data[i].largeImageURL),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }
}
