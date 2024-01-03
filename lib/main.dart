import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playSound(int soundNumber) async {
    final player = AudioPlayer();
    await player.play(
      AssetSource('note$soundNumber.wav'),
    );
  }

  Expanded keyBuilder({required Color color, required int soundNumber}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
        ),
        onPressed: () {
          playSound(soundNumber);
        },
        child: const Text(""),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              keyBuilder(color: Colors.red, soundNumber: 1),
              keyBuilder(color: Colors.orange, soundNumber: 2),
              keyBuilder(color: Colors.yellow, soundNumber: 3),
              keyBuilder(color: Colors.green, soundNumber: 4),
              keyBuilder(color: Colors.blue, soundNumber: 5),
              keyBuilder(color: Colors.purple, soundNumber: 6),
              keyBuilder(color: Colors.teal, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
