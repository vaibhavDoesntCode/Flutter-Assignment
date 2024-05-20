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

    setState(() {
      BMI =
          (100 * 100 * weightNumber / (heightNumber * heightNumber)).toStringAsFixed(2);
    });
  }

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
                  hintText: 'in cm',
                  labelText: 'Enter height',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'in kgs',
                  labelText: 'Enter weight',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
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
              Text(
                BMI,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
