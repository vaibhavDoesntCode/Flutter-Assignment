

import 'package:flutter/material.dart';

class Try extends StatefulWidget {
  const Try({super.key});

  @override
  State<Try> createState() => _TryState();
}

class _TryState extends State<Try> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('try'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _value = _value + 1;
          });        
        },
        child: Text(_value.toString()),
      ),
    );
  }
}
