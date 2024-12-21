import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> items = List.generate(20, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Grid Home Page'),
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
            return PlantCard(plantName: "$index");
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
      },
      child: Card(
        child: Text(plantName),
      ),
    );
  }
}

class LightMeterCard extends StatefulWidget {
  const LightMeterCard({
    super.key,
  });

  @override
  State<LightMeterCard> createState() => _LightMeterCardState();
}

class _LightMeterCardState extends State<LightMeterCard> {
  @override
  Widget build(BuildContext context) {
    return Card();
  }
}
