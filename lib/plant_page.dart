import 'package:flutter/material.dart';

class PlantPage extends StatefulWidget {
  const PlantPage({
    super.key,
    required this.plantData,
  });

  final Map<String, dynamic> plantData;

  @override
  State<PlantPage> createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chat),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 256,
                  height: 256,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(128),
                      image: DecorationImage(
                          image: NetworkImage(widget.plantData["image_uri"]))),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                widget.plantData["name"],
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Species: ${widget.plantData["species"]}"),
              Text(
                  "${widget.plantData["location"]}, ${widget.plantData["light_exposition"]}"),
              const SizedBox(height: 32),
              Text(widget.plantData["care_instructions"]),
            ],
          ),
        ),
      ),
    );
  }
}
