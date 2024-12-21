import 'package:flutter/material.dart';

class PlantPage extends StatefulWidget {
  const PlantPage({super.key});

  @override
  State<PlantPage> createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PLANT NAME"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 256,
              width: 256,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
