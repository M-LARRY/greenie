import 'dart:async';
import 'package:flutter/material.dart';
import 'package:greenie/functions.dart';
import 'plant_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = true;
  // this is the list of plants to show
  List<Map<String, dynamic>> collection = [];
  int lightSensorValue = -1;

  void startReadingLightSensor() async {
    Timer.periodic(Duration(seconds: 1), (Timer timer) async {
      int value = await readLightSensor();
      setState(() {
        lightSensorValue = value;
      });
    });
  }

  void getUserData({required String userId}) async {
    Map<String, dynamic> res = await getCollection(userId: "userId");
    setState(() {
      if (res["plant_collection"] != null) {
        for (String key in res["plant_collection"].keys) {
          collection.add(res["plant_collection"][key]);
        }
      }
      loading = false;
    });
    return;
  }

  @override
  void initState() {
    getUserData(userId: "UserId");
    startReadingLightSensor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print(collection);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collection'),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return const CustomBottomSheet();
                    });
              },
              icon: const Icon(Icons.add)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: (loading)
            ? Placeholder()
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two items per row
                  crossAxisSpacing: 8.0, // Space between horizontal items
                  mainAxisSpacing: 8.0, // Space between vertical items
                ),
                itemCount: collection.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return LightMeterCard(lightReading: lightSensorValue);
                  } else {
                    return PlantCard(plantData: collection[index - 1]);
                  }
                },
              ),
      ),
    );
  }
}

class PlantCard extends StatelessWidget {
  const PlantCard({
    super.key,
    required this.plantData,
  });

  final Map<String, dynamic> plantData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return PlantPage(
            plantData: plantData,
          );
        }));
      },
      child: Card(
        child: Text(plantData["name"]),
      ),
    );
  }
}

class LightMeterCard extends StatelessWidget {
  const LightMeterCard({
    super.key,
    required this.lightReading,
  });

  final int lightReading;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Light reading:"),
            Text("$lightReading"),
          ],
        ),
      ),
    );
  }
}

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: () {},
        showDragHandle: true,
        builder: (BuildContext context) {
          return SizedBox(
            height: 240,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                  child: Text(
                    "Add a plant to your collection",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                  child: Text(
                      "You can take a picture of a plant or load one from the gallery. You will need to provide the light exposition and the location of the plant."),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                  child: FilledButton(
                      onPressed: () {
                        Navigator.pop(context);
                        //navigator push qualcosa
                      },
                      child: const Text("Take a picture")),
                ),
                FilledButton(
                    onPressed: () {}, child: const Text("Load from gallery")),
              ]),
            ),
          );
        });
  }
}
