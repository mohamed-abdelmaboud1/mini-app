import 'package:flutter/material.dart';

class BaselineExample extends StatelessWidget {
  const BaselineExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Baseline(
            baseline: 50,
            baselineType: TextBaseline.alphabetic,
            child: const Text(
              "Hello",
              style: TextStyle(fontSize: 30, color: Colors.blue),
            ),
          ),
          Baseline(
            baseline: 50,
            baselineType: TextBaseline.alphabetic,
            child: const Text(
              "World",
              style: TextStyle(fontSize: 60, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
