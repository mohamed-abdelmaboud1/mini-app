import 'package:flutter/material.dart';

class DragTargetExample extends StatefulWidget {
  const DragTargetExample({super.key});

  @override
  _DragTargetExampleState createState() => _DragTargetExampleState();
}

class _DragTargetExampleState extends State<DragTargetExample> {
  Color caughtColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Draggable widget
        Draggable<Color>(
          data: Colors.blue, // data is the value this will be in the target
          feedback: Container(
            width: 50,
            height: 50,
            color: Colors.blue.withOpacity(0.7), // semi-transparent that drag
          ),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ), // the source from where we drag
        ),
        const SizedBox(height: 50),

        // DragTarget widget
        DragTarget<Color>(
          onWillAcceptWithDetails: (color) {
            return true;
          }, // accept any Color
          onAcceptWithDetails: (details) {
            setState(() {
              caughtColor = details.data; // update target with dropped color
            });
          },
          onLeave: (data) {
            debugPrint('onLeave: $data');
          },
          builder: (context, candidateData, rejectedData) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              width: 150,
              height: 150,
              color: caughtColor,
              child: const Center(child: Text("Drop Here")),
            );
          },
        ),
      ],
    );
  }
}
