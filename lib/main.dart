import 'package:flutter/material.dart';

void main() {
  runApp(const SizedBoxDemoApp());
}

class SizedBoxDemoApp extends StatelessWidget {
  const SizedBoxDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SizedBox Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SizedBoxDemoScreen(),
    );
  }
}

/// Demonstrates three SizedBox properties: width, height, and SizedBox.expand.
class SizedBoxDemoScreen extends StatefulWidget {
  const SizedBoxDemoScreen({super.key});

  @override
  State<SizedBoxDemoScreen> createState() => _SizedBoxDemoScreenState();
}

class _SizedBoxDemoScreenState extends State<SizedBoxDemoScreen> {
  // State for each property's slider
  double _width = 200;
  double _height = 100;
  double _expandHeight = 120;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SizedBox Widget Demo'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== PROPERTY 1: width =====
            // SizedBox with a fixed width. Default is null (unconstrained).
            const Text(
              '1. width',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: _width, // forces the child to be exactly this wide
              child: Container(
                color: Colors.deepPurple.shade100,
                padding: const EdgeInsets.all(12),
                child: Text('Width: ${_width.round()}px'),
              ),
            ),
            Slider(
              value: _width,
              min: 50,
              max: 350,
              label: '${_width.round()}',
              onChanged: (v) => setState(() => _width = v),
            ),

            const SizedBox(height: 16),

            // ===== PROPERTY 2: height =====
            // SizedBox with a fixed height. Default is null (unconstrained).
            const Text(
              '2. height',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: _height, // forces the child to be exactly this tall
              child: Container(
                color: Colors.deepPurple.shade200,
                padding: const EdgeInsets.all(12),
                child: Text('Height: ${_height.round()}px'),
              ),
            ),
            Slider(
              value: _height,
              min: 30,
              max: 200,
              label: '${_height.round()}',
              onChanged: (v) => setState(() => _height = v),
            ),

            const SizedBox(height: 16),

            // ===== PROPERTY 3: SizedBox.expand =====
            // Named constructor that sets width & height to double.infinity,
            // making the child fill all available space in its parent.
            const Text(
              '3. SizedBox.expand',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: _expandHeight, // outer constraint
              child: SizedBox.expand(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Fills all space (height: ${_expandHeight.round()}px)',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Slider(
              value: _expandHeight,
              min: 50,
              max: 250,
              label: '${_expandHeight.round()}',
              onChanged: (v) => setState(() => _expandHeight = v),
            ),
          ],
        ),
      ),
    );
  }
}
