import 'package:flutter/material.dart';
import 'package:mini_app/features/home/ui/views/absorb_pointer_example.dart';
import 'package:mini_app/features/home/ui/views/autocomplete_basic_user_example.dart';
import 'package:mini_app/features/home/ui/views/drag_target_example.dart';
import 'package:mini_app/features/home/ui/views/draggable_example.dart';

import 'dismissible_example.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home View')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FlutterLogo(
                size: 200,
                style: FlutterLogoStyle.horizontal,
                textColor: Colors.blue,
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
              ),
              const SizedBox(height: 20),
              AutocompleteBasicUserExample(), //(like a search bar with suggestions).
              const SizedBox(height: 20),
              AbsorbPointerExample(), //(a widget that absorbs pointer events).
              const SizedBox(height: 20),
              DismissibleExample(), //(a list of dismissible items).
              const SizedBox(height: 20),
              DragTargetExample(), //(a drag-and-drop area).
              const SizedBox(height: 20),
              DraggableExample(),
              const SizedBox(height: 20),
              const Task(), //(a task with draggable colors and a drop area).
            ],
          ),
        ),
      ),
    );
  }
}

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  Color caughtColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Draggable<Color>(
              data: Colors.blue, // data will be moved to the target
              feedback: AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                width: 100,
                height: 100,
                color: Colors.blue.withOpacity(
                  0.7,
                ), // semi-transparent that drag
              ),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ), // the source from where we drag
            ),
            Draggable<Color>(
              data: Colors.red, // data will be moved to the target
              feedback: AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                width: 100,
                height: 100,
                color: Colors.red.withOpacity(
                  0.7,
                ), // semi-transparent that drag
              ),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ), // the source from where we drag
            ),
            Draggable<Color>(
              data: Colors.green, // data will be moved to the target
              feedback: AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                width: 100,
                height: 100,
                color: Colors.green.withOpacity(
                  0.7,
                ), // semi-transparent that drag
              ),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ), // the source from where we drag
            ),
          ],
        ),
        const SizedBox(height: 20),
        DragTarget<Color>(
          onAcceptWithDetails: (details) {
            setState(() {
              caughtColor = details.data; // update target with dropped color
              debugPrint('onAccept: ${details.data}');
            });
          },
          onWillAcceptWithDetails: (color) {
            // Only accept red
            return color.data == Colors.red;
          },
          builder: (context, candidateData, rejectedData) {
            return Container(
              width: 150,
              height: 150,
              color: candidateData.isNotEmpty
                  ? Colors.red.withOpacity(0.7)
                  : caughtColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Drop only RED"),
                  if (candidateData.isNotEmpty)
                    const Text("✅ Red candidate here"),
                  if (rejectedData.isNotEmpty) const Text("❌ Wrong color!"),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
