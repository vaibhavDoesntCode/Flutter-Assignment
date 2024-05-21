import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String out = "";
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: const Color.fromARGB(153, 0, 115, 255),
      ),

      body: Column(
        children: [
          SizedBox(
            height: 300,
                child: SingleChildScrollView(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      out,                
                      style: const TextStyle(fontSize: 34),
                    ),
                  ),
                ),
              ),
          Row(
            children: [
              Container(
                width: 98,
                height: 100,
                color: Colors.blueGrey,
                child: GestureDetector(
                  onTap: () {
    try {
      Parser p = Parser();
      Expression exp = p.parse(out);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      setState(() {
        out = eval.toString();
      });
    } catch (e) {
      setState(() {
        out = "Error";
      });
    }
  },
                  child: const Center(
                      child: SizedBox(
                    width: 98,
                    height: 100,
                    child: Text(
                      '=',
                      style: TextStyle(fontSize: 34),
                    ),
                  )),
                ),
              ),
              Container(
                width: 98,
                height: 100,
                color: Colors.blueGrey,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      out = '';
                    });
                  },
                  child: const Center(
                      child: SizedBox(
                    width: 98,
                    height: 100,
                    child: Text(
                      'C',
                      style: TextStyle(fontSize: 34),
                    ),
                  )),
                ),
              ),
              Container(
                width: 98,
                height: 100,
                color: Colors.blueGrey,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      out += '0';
                    });
                  },
                  child: const Center(
                      child: SizedBox(
                    width: 98,
                    height: 100,
                    child: Text(
                      '0',
                      style: TextStyle(fontSize: 34),
                    ),
                  )),
                ),
              ),
              Container(
                width: 98,
                height: 100,
                color: Colors.blueGrey,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      out += '/';
                    });
                  },
                  child: const Center(
                      child: SizedBox(
                    width: 98,
                    height: 100,
                    child: Text(
                      '/',
                      style: TextStyle(fontSize: 34),
                    ),
                  )),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 98,
                height: 100,
                color: Colors.blueGrey,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      out += '7';
                    });
                  },
                  child: const Center(
                      child: SizedBox(
                    width: 98,
                    height: 100,
                    child: Text(
                      '7',
                      style: TextStyle(fontSize: 34),
                    ),
                  )),
                ),
              ),
              Container(
                width: 98,
                height: 100,
                color: Colors.blueGrey,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      out += '8';
                    });
                  },
                  child: const Center(
                      child: SizedBox(
                    width: 98,
                    height: 100,
                    child: Text(
                      '8',
                      style: TextStyle(fontSize: 34),
                    ),
                  )),
                ),
              ),
              Container(
                width: 98,
                height: 100,
                color: Colors.blueGrey,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      out += '9';
                    });
                  },
                  child: const Center(
                      child: SizedBox(
                    width: 98,
                    height: 100,
                    child: Text(
                      '9',
                      style: TextStyle(fontSize: 34),
                    ),
                  )),
                ),
              ),
              Container(
                width: 98,
                height: 100,
                color: Colors.blueGrey,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      out += '*';
                    });
                  },
                  child: const Center(
                      child: SizedBox(
                    width: 98,
                    height: 100,
                    child: Text(
                      '*',
                      style: TextStyle(fontSize: 34),
                    ),
                  )),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 98,
                height: 100,
                color: Colors.blueGrey,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      out += '4';
                    });
                  },
                  child: const Center(
                      child: SizedBox(
                    width: 98,
                    height: 100,
                    child: Text(
                      '4',
                      style: TextStyle(fontSize: 34),
                    ),
                  )),
                ),
              ),
              Container(
                width: 98,
                height: 100,
                color: Colors.blueGrey,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      out += '5';
                    });
                  },
                  child: const Center(
                      child: SizedBox(
                    width: 98,
                    height: 100,
                    child: Text(
                      '5',
                      style: TextStyle(fontSize: 34),
                    ),
                  )),
                ),
              ),
              Container(
                width: 98,
                height: 100,
                color: Colors.blueGrey,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      out += '6';
                    });
                  },
                  child: const Center(
                      child: SizedBox(
                    width: 98,
                    height: 100,
                    child: Text(
                      '6',
                      style: TextStyle(fontSize: 34),
                    ),
                  )),
                ),
              ),
              Container(
                width: 98,
                height: 100,
                color: Colors.blueGrey,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      out += '-';
                    });
                  },
                  child: const Center(
                      child: SizedBox(
                    width: 98,
                    height: 100,
                    child: Text(
                      '-',
                      style: TextStyle(fontSize: 34),
                    ),
                  )),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 98,
                height: 100,
                color: Colors.blueGrey,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      out += '1';
                    });
                  },
                  child: const Center(
                      child: SizedBox(
                    width: 98,
                    height: 100,
                    child: Text(
                      '1',
                      style: TextStyle(fontSize: 34),
                    ),
                  )),
                ),
              ),
              Container(
                width: 98,
                height: 100,
                color: Colors.blueGrey,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      out += '2';
                    });
                  },
                  child: const Center(
                      child: SizedBox(
                    width: 98,
                    height: 100,
                    child: Text(
                      '2',
                      style: TextStyle(fontSize: 34),
                    ),
                  )),
                ),
              ),
              Container(
                width: 98,
                height: 100,
                color: Colors.blueGrey,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      out += '3';
                    });
                  },
                  child: const Center(
                      child: SizedBox(
                    width: 98,
                    height: 100,
                    child: Text(
                      '3',
                      style: TextStyle(fontSize: 34),
                    ),
                  )),
                ),
              ),
              Container(
                width: 98,
                height: 100,
                color: Colors.blueGrey,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      out += '+';
                    });
                  },
                  child: const Center(
                      child: SizedBox(
                    width: 98,
                    height: 100,
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 34),
                    ),
                  )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
