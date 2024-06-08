// ignore_for_file: use_key_in_widget_constructors
import 'snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'code_editor.dart'; // Import the CodeEditor widget here
import 'codingProblems.dart'; // Import the codingProblems list here
import 'submit_button.dart'; // Import the SubmitButton widget here

void main() {
  runApp(const MyApp());
}

void showSnackbar(BuildContext context) {
  SnackbarWidget.showSnackbar(context, 'Code submitted');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coding Test App',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const CodingTestScreen(),
    );
  }
}

class CodingTestScreen extends StatefulWidget {
  const CodingTestScreen({Key? key});

  @override
  _CodingTestScreenState createState() => _CodingTestScreenState();
}

class _CodingTestScreenState extends State<CodingTestScreen> {
  int currentProblemIndex = 0;
  bool showWarning = true;

  void nextProblem() {
    setState(() {
      currentProblemIndex = (currentProblemIndex + 1) % codingProblems.length;
      showWarning = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Coding Test App',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.amberAccent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amberAccent,
              ),
              child: Text(
                'Categories',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              title: const Text('Array'),
              onTap: () {
                // Implement category selection logic here
              },
            ),
            ListTile(
              title: const Text('Recursion'),
              onTap: () {
                // Implement category selection logic here
              },
            ),
            ListTile(
              title: const Text('Graph'),
              onTap: () {
                // Implement category selection logic here
              },
            ),
            ListTile(
              title: const Text('Dynamic Programming'),
              onTap: () {
                // Implement category selection logic here
              },
            ),
            ListTile(
              title: const Text('Binary Tree'),
              onTap: () {
                // Implement category selection logic here
              },
            ),
            // Add more ListTiles for other categories
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Problem Statement:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors
                    .yellowAccent[100], // Use a primary color for emphasis
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              codingProblems[currentProblemIndex]['statement']!,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.white70, // Use a darker color for text
              ),
            ),
            const SizedBox(height: 20.0),
            const Expanded(
              child: CodeEditor(),
            ),
            if (showWarning) // Show the warning conditionally
              Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.red,
                child: const Text(
                  'Warning: Plagiarism is not tolerated!',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: nextProblem,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Use primary color for buttons
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0), // Increase button padding
              ),
              child: const Text(
                'Next',
                style: TextStyle(
                  color: Colors.yellowAccent, // Dark green color
                  fontWeight: FontWeight.bold, // Bold font weight
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            SubmitButton(
                onPressed: () => showSnackbar(context),
                color: Colors.black), // Use primary color for SubmitButton
          ],
        ),
      ),
    );
  }
}
