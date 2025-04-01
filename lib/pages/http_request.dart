import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:device_info_plus/device_info_plus.dart';

Future<AndroidDeviceInfo> deviceInfo() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  return androidInfo;
}

class HttpRequest extends StatefulWidget {
  @override
  State<HttpRequest> createState() => _HttpRequestState();
}

class _HttpRequestState extends State<HttpRequest> {
  // output message String
  String message = '';
  // bool isloading
  bool isLoading = false;

  void _onButtonPressed() async {
    setState(() {
      isLoading = true;
    });
    final url = Uri.parse('https://httpbin.org/post');
    final headers = {'Content-Type': 'application/json'};

    // Await the device info
    final androidInfo = await deviceInfo();

    // Build the body with the resolved values
    final body = jsonEncode({
      'currentDateTime': DateTime.now().toIso8601String(),
      'deviceName': androidInfo.model,
      'deviceVersion': androidInfo.version.release,
      'deviceManufacturer': androidInfo.manufacturer,
    });

    // Send the HTTP POST request
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      // Handle successful response
      print('Response: ${response.body}');
      final output = jsonDecode(response.body);
      setState(() {
        message = 'Response: ${output['json']}';
        isLoading = false;
      });
    } else {
      // Handle error response
      print('Error: ${response.statusCode}');
      setState(() {
        message = 'Error: ${response.statusCode}';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HTTP Request',
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
              'Send a HTTP POST request',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CustomButton(onPressed: _onButtonPressed),
            isLoading ? const CircularProgressIndicator() : Text(message),
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
