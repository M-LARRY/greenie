import 'package:flutter/material.dart';
import 'plant_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // items is the list of elements that will be displayed on the page
  // leave the first one empty, it will be replaced by the light meter
  final List<String> items = List.generate(20, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Greenie'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two items per row
            crossAxisSpacing: 8.0, // Space between horizontal items
            mainAxisSpacing: 8.0, // Space between vertical items
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return LightMeterCard(lightReading: 100);
            } else {
              return PlantCard(plantName: "$index");
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
    required this.plantName,
  });

  final String plantName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("DEBUG: PRESSED PLANT $plantName");
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return PlantPage();
        }));
      },
      child: Card(
        child: Text(plantName),
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
        child: Text("$lightReading"),
      ),
    );
  }
}
