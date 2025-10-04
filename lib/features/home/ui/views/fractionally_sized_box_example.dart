import 'package:flutter/material.dart';

class FractionallySizedBoxExample extends StatelessWidget {
  const FractionallySizedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 100,
      width: double.infinity,
      child: FractionallySizedBox(
        heightFactor: 0.5,
        widthFactor: 0.5,
        alignment: Alignment.center,
        child: Container(color: Colors.red),
      ),
    );
  }
}
