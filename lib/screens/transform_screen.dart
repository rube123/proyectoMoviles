import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_application_1/widgets/attribute_widget.dart';

class TransformScreen extends StatefulWidget {
  const TransformScreen({super.key});

  @override
  State<TransformScreen> createState() => _TransformScreenState();
}

class _TransformScreenState extends State<TransformScreen> {
  double rotationY = 0; // Controls the rotation of the top container
  final double rowHeight = 180; // Height of the hero image container
  double speed = 75; // Progress for speed
  double health = 90; // Progress for health
  double attack = 60; // Progress for attack

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transform 3D Demo")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container with stacked 3D layers and hero with attributes
            Container(
              height: rowHeight,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Bottom container (fixed rotation)
                  Transform.translate(
                    offset: Offset(-10, 0),
                    child: Transform(
                      alignment: FractionalOffset.center,
                      transform:
                          Matrix4.identity()
                            ..setEntry(3, 2, 0.01)
                            ..rotateY(1.5 * pi / 180),
                      child: Container(
                        height: 216,
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.all(Radius.circular(22)),
                        ),
                      ),
                    ),
                  ),
                  // Top container (controlled by slider)
                  Transform.translate(
                    offset: Offset(-44, 0),
                    child: Transform(
                      alignment: FractionalOffset.center,
                      transform:
                          Matrix4.identity()
                            ..setEntry(3, 2, 0.01)
                            ..rotateY(rotationY * pi / 180),
                      child: Container(
                        height: 188,
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.all(Radius.circular(22)),
                        ),
                      ),
                    ),
                  ),
                  // Hero image with attributes on the right
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Transform.translate(
                        offset: Offset(-30, 0),
                        child: AttributeWidget(
                          progress: speed,
                          size: rowHeight,
                          child: Image.network(
                            'https://flutter4fun.com/wp-content/uploads/2020/11/Player-1.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Spacer(),
                      // Attributes column on the right
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(right: 58),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AttributeWidget(
                                progress: speed,
                                size: 60,
                                child: Image.network(
                                  'https://flutter4fun.com/wp-content/uploads/2020/11/speed.png',
                                ),
                              ),
                              AttributeWidget(
                                progress: health,
                                size: 60,
                                child: Image.network(
                                  'https://flutter4fun.com/wp-content/uploads/2020/11/heart.png',
                                ),
                              ),
                              AttributeWidget(
                                progress: attack,
                                size: 60,
                                child: Image.network(
                                  'https://flutter4fun.com/wp-content/uploads/2020/11/knife.png',
                                ),
                              ),
                              SizedBox(
                                height: 32,
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: Text(
                                    'See Details',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            // Slider to control top container rotation
            Slider(
              min: -180,
              max: 180,
              value: rotationY,
              onChanged: (value) {
                setState(() {
                  rotationY = value;
                });
              },
            ),
            Text("Rotación Y: ${rotationY.toStringAsFixed(1)}°"),
            SizedBox(height: 20),
            // Sliders to adjust hero attributes
            Slider(
              min: 0,
              max: 100,
              value: speed,
              onChanged: (value) {
                setState(() {
                  speed = value;
                });
              },
            ),
            Text("Speed: ${speed.toStringAsFixed(0)}%"),
            Slider(
              min: 0,
              max: 100,
              value: health,
              onChanged: (value) {
                setState(() {
                  health = value;
                });
              },
            ),
            Text("Health: ${health.toStringAsFixed(0)}%"),
            Slider(
              min: 0,
              max: 100,
              value: attack,
              onChanged: (value) {
                setState(() {
                  attack = value;
                });
              },
            ),
            Text("Attack: ${attack.toStringAsFixed(0)}%"),
          ],
        ),
      ),
    );
  }
}
