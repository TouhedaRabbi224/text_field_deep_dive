import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Text Field Deep Dive'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: TextFieldDeepDive(),
    );

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}

class TextFieldDeepDive extends StatefulWidget {
  const TextFieldDeepDive({super.key});

  @override
  State<TextFieldDeepDive> createState() => _TextFieldDeepDiveState();
}

class _TextFieldDeepDiveState extends State<TextFieldDeepDive> {
  String text = '';
  bool _secure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter Your Name',
              hintStyle: TextStyle(
                color: Colors.red,
                fontFamily: 'LaBelleAurore',
              ),
              labelText: 'Name',
              labelStyle: TextStyle(
                color: Colors.orange,
                fontSize: 20,
                fontFamily: 'RobotoMono',
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              prefixIcon: Icon(Icons.account_circle),
              suffixIcon: IconButton(
                icon: Icon(_secure ? Icons.remove_red_eye : Icons.security),
                onPressed: () {
                  setState(() {
                    _secure = !_secure;
                  });
                },
              ),
              errorText: text.isEmpty ? 'error' : null,
            ),
            keyboardType: TextInputType.text,
            obscureText: _secure,
            obscuringCharacter: '*',
            maxLength: 10,
            // maxLines: 2,
            onChanged: (value) {
              text = value;
            },
            onSubmitted: (value) {
              setState(() {
                text = value;
              });
              print(value);
            },
          ),
        ],
      ),
    );
  }
}
