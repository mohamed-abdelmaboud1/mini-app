import 'package:flutter/material.dart';

class AbsorbPointerExample extends StatelessWidget {
  const AbsorbPointerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      height: 56.0,
      child: AbsorbPointer(
        absorbing: true,

        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade200,
          ),
          onPressed: () {
            debugPrint('Button Pressed');
          },
          child: null,
        ),
      ),
    );
  }
}
