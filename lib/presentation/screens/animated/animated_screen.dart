import 'dart:math' show Random;

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {

  static const name = 'anmimated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  Color color = Colors.indigo;
  double width = 50;
  double height = 50;
  double borderRadius = 10;

  void changeShape() {

    final random = Random();

    
    width = random.nextInt(300) + 50;
    height = random.nextInt(300) + 50;
    borderRadius = random.nextDouble() * 100;
    color = Color.fromARGB(
      random.nextInt(255),  // Red
      random.nextInt(255),  // Green
      random.nextInt(255),  // Blue
      1                     // Opacity
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated container'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,//() => changeShape(),
        child: const Icon(Icons.play_arrow_rounded),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400), //Duración en miliseguindos
          curve: Curves.easeInOutCubic, //Tipo de animación
          width: width < 0? 0: width,
          height: height < 0? 0: height,
          decoration: BoxDecoration(                      
            color: color,
            borderRadius: BorderRadius.circular(borderRadius<0 ? 0: borderRadius)
          ),
        ),
      ),
    );
  }
}