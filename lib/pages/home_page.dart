import 'package:flutter/material.dart';
import 'package:flutter_uek_app/pages/bmicalculator/bmicalculator.dart';
import 'package:flutter_uek_app/pages/counter.dart';
import 'package:flutter_uek_app/pages/http_request.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onButtonPressed(BuildContext context, String page) {
    Widget destination;
    print("Button pressed: $page");

    if (page == "http_request") {
      destination = HttpRequest();
    } else if (page == "counter") {
      destination = Counter();
    } else if (page == "bmi-calc") {
      destination = BmiCalculator();
    } else {
      return; // Do nothing if the page is not recognized
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter App',
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
              'Welcome to My Flutter App!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () => _onButtonPressed(context, "http_request"),
              child: const Text('To HTTP Request'),
            ),
            ElevatedButton(
              onPressed: () => _onButtonPressed(context, "counter"),
              child: const Text('To Counter'),
            ),
            ElevatedButton(
              onPressed: () => _onButtonPressed(context, "bmi-calc"),
              child: const Text('To BMI Calculator'),
            ),
          ],
        ),
      ),
    );
  }
}
