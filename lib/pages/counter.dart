import 'package:flutter/material.dart';

setUp(int value) {
  return value + 1;
}

setDown(int value) {
  return value - 1;
}

reset() {
  return 0;
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Counter',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            value = reset();
          });
        },
        child: const Icon(Icons.refresh),
      ),
      body: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed:
                      () => setState(() {
                        value = setDown(value);
                      }),
                  child: Text("-1"),
                ),
                Text(value.toString()),
                ElevatedButton(
                  onPressed:
                      () => setState(() {
                        value = setUp(value);
                      }),
                  child: Text("+1"),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  value = 0;
                });
              },
              child: const Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}
