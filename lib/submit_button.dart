import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color; // Add color parameter here

  const SubmitButton({
    Key? key,
    required this.onPressed,
    required this.color, // Add color parameter to the constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Use color parameter to set background color
        ),
        child: const Text(
          'Submit Code',
          style: TextStyle(
            color: Color.fromARGB(255, 33, 152, 37), // Dark green color
            fontWeight: FontWeight.bold, // Bold font weight
          ),
        ),
      ),
    );
  }
}
