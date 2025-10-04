import 'package:flutter/material.dart';

class LimitedBoxExample extends StatelessWidget {
  const LimitedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LimitedBox(
          maxWidth: 200,
          maxHeight: 50,

          child: Container(
            color: Colors.blue,
            height: 500,
            child: const Text('With LimitedBox'),
          ),
        ),
      ],
    );
  }
}
