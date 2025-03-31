import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<http.Response> _onButtonPressed() {
    final url = Uri.parse('https://httpbin.org/post');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'currentDateTime': DateTime.now().toIso8601String(),
      'deviceName': 'Android von ZLI',
    });

    return http.post(url, headers: headers, body: body).then((response) {
      if (response.statusCode == 200) {
        // Handle successful response
        print('Response data: ${response.body}');
      } else {
        // Handle error response
        print('Error: ${response.statusCode}');
      }
      return response;
    });
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
            const SizedBox(height: 20),
            CustomButton(onPressed: _onButtonPressed),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        backgroundColor: Colors.indigo,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: const Text(
        'Click Me',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
