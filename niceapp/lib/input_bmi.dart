

import 'package:flutter/material.dart';

class InputBMI extends StatefulWidget {
  const InputBMI({Key? key}) : super(key: key);

  @override
  State<InputBMI> createState() => _InputBMIState();
}

class _InputBMIState extends State<InputBMI> {
  var heightController = TextEditingController();
  var weightController = TextEditingController();
  String _errorMessage = '';
  String BMI = '';

  void _validateInput() {
    setState(() {
      _errorMessage = '';
      BMI = '';
    });

    String height = heightController.text;
    String weight = weightController.text;

    if (height.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter height';
      });
      return;
    }

    if (weight.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter weight';
      });
      return;
    }

    final heightNumber = num.tryParse(height);
    final weightNumber = num.tryParse(weight);

    if (heightNumber == null) {
      setState(() {
        _errorMessage = 'Please enter a valid height';
      });
      return;
    }

    if (weightNumber == null) {
      setState(() {
        _errorMessage = 'Please enter a valid weight';
      });
      return;
    }

    num realHeight;
    if (selectedHeight.first == 'm') {
      realHeight = 100.0 * heightNumber;
    } else if (selectedHeight.first == 'inches') {
      realHeight = 2.54 * heightNumber;
    } else {
      realHeight = heightNumber;
    }
    num realWeight;
    if (selectedWeight.first == 'lbs') {
      realWeight = 0.453592 * weightNumber;
    } else {
      realWeight = weightNumber;
    }

    setState(() {
      BMI = (100 * 100 * realWeight / (realHeight * realHeight))
          .toStringAsFixed(2);
    });
  }

  Set<String> selectedHeight = {'cm'};
  Set<String> selectedWeight = {'kgs'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI calculator'),
        backgroundColor: const Color.fromARGB(153, 0, 115, 255),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'in ${selectedHeight.first}',
                  labelText: 'Enter height',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SegmentedButton(
                segments: const [
                  ButtonSegment(value: 'cm', label: Text('cm')),
                  ButtonSegment(
                    value: 'm',
                    label: Text('meters'),
                  ),
                  ButtonSegment(value: 'inches', label: Text('Inches'))
                ],
                selected: selectedHeight,
                onSelectionChanged: (Set<String> newSelectedHeight) {
                  setState(() {
                    selectedHeight = newSelectedHeight;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'in  + ${selectedWeight.first}',
                  labelText: 'Enter weight',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SegmentedButton(
                segments: const [
                  ButtonSegment(value: 'kgs', label: Text('kgs')),
                  ButtonSegment(
                    value: 'lbs',
                    label: Text('Pounds'),
                  ),
                ],
                selected: selectedWeight,
                onSelectionChanged: (Set<String> newSelectedWeight) {
                  setState(() {
                    selectedWeight = newSelectedWeight;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _validateInput,
                child: const Text('Calculate'),
              ),
              const SizedBox(height: 20),
              Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  BMI,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
