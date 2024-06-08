// ignore_for_file: library_private_types_in_public_api

import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:highlight/languages/dart.dart';

class CodeEditor extends StatefulWidget {
  const CodeEditor({Key? key}) : super(key: key);

  @override
  _CodeEditorState createState() => _CodeEditorState();
}

class _CodeEditorState extends State<CodeEditor> {
  late CodeController _codeController;
  Map<String, TextStyle>? theme = monokaiSublimeTheme;

  @override
  void initState() {
    super.initState();
    final source = "void main() {\n    print(\"Hello, world!\");\n}";
    _codeController = CodeController(
      text: source,
      language: dart,
    );
    theme = monokaiSublimeTheme;
  }

  void resetCode() {
    setState(() {
      _codeController.text = ''; // Clear the code text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: "</>",
                style: TextStyle(color: Colors.green, fontSize: 40),
              ),
              TextSpan(
                text: " Code",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 0), // Custom gray color
        actions: [
          IconButton(
            icon: Icon(Icons.refresh), // Reset icon
            onPressed: resetCode, // Call resetCode function when clicked
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), // Rounded edges
            border: Border.all(color: Colors.white, width: 5), // White border
          ),
          child: CodeField(
            controller: _codeController,
            textStyle: const TextStyle(fontFamily: 'SourceCode', fontSize: 20),
          ),
        ),
      ),
    );
  }
}
