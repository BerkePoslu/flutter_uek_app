import 'package:flutter/material.dart';
import 'package:flutter_uek_app/pages/bmicalculator/bmicalculator_result.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

void onPressed(int weight, int height, BuildContext context) {
  double heightInMeters = (height / 100);
  if (weight <= 0 || height <= 0) {
    // Handle invalid input
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please enter valid weight and height')),
    );
    return;
  }
  double bmi = weight / (heightInMeters * heightInMeters);
  String result;

  if (bmi < 18.5) {
    result = "Underweight";
  } else if (bmi >= 18.5 && bmi < 25.5) {
    result = "Normal weight";
  } else if (bmi >= 25.5 && bmi < 29.9) {
    result = "Overweight";
  } else {
    result = "Obesity";
  }

  print(bmi);
  print(result);

  Navigator.push(
    context,
    MaterialPageRoute(
      builder:
          (context) => BmicalculatorResult(bmi: bmi.toInt(), result: result),
    ),
  );
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int weight = 0;
  int height = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "BMI Calculator",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Enter your weight (kg):",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    // Handle empty Input
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter a weight')),
                    );
                    // Reset weight to 0

                    weight = 0;
                    return;
                  }
                  weight = int.parse(value);
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Weight in kg',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Enter your height (cm):",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    // Handle invalid input
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter an height')),
                    );
                    return;
                  }
                  height = int.parse(value);
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Height in centimeters',
              ),
            ),
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: () => onPressed(weight, height, context),
              child: Text('Calculate BMI'),
            ),
          ],
        ),
      ),
    );
  }
}
