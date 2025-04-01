import 'package:flutter/material.dart';
import 'package:flutter_uek_app/pages/http_request.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onButtonPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HttpRequest()),
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
              onPressed: () => _onButtonPressed(context),
              child: const Text('Send Request and Navigate'),
            ),
          ],
        ),
      ),
    );
  }
}
