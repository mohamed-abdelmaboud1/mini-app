import 'package:flutter/material.dart';

class AbsorbPointerExample extends StatelessWidget {
  const AbsorbPointerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200.0,
          height: 56.0,
          child: AbsorbPointer(
            absorbing: true,

            child: ElevatedButton(
              onPressed: () {
                debugPrint("Button Pressed!");
              },
              child: const Text("Can't Press Me Absorb"),
            ),
          ),
        ),
        SizedBox(
          width: 200.0,
          height: 56.0,
          child: IgnorePointer(
            ignoring: true,

            child: ElevatedButton(
              onPressed: () {
                debugPrint("Button Pressed!");
              },
              child: const Text("Can't Press Me Ignore"),
            ),
          ),
        ),
        const SizedBox(height: 8.0),

        Stack(
          alignment: Alignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                debugPrint("Background Button Pressed!");
              },
              child: const Text("Background Button"),
            ),

            //! only ignore its child
            IgnorePointer(
              // AbsorbPointer(
              ignoring: true,
              child: Container(
                color: Colors.black.withValues(alpha: 0.3),
                width: 200,
                height: 100,
                child: InkWell(
                  onTap: () {
                    debugPrint("Background Button Pressed!");
                  },
                  child: Text("Background Button"),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class OffstageExample extends StatefulWidget {
  const OffstageExample({super.key});

  @override
  State<OffstageExample> createState() => _OffstageExampleState();
}

class _OffstageExampleState extends State<OffstageExample> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: isHidden,
          //! maintainSize: true, if you want to keep the size even when hidden
          //! maintainState: true,
          //! maintainAnimation: true,
          replacement: Text(
            "I'm hidden",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          child: Container(
            color: Colors.blue.withValues(alpha: 0.3),
            width: 200,
            height: 500,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              isHidden = !isHidden;
            });
          },
          child: Text(isHidden ? "Show" : "Hide"),
        ),
      ],
    );
  }
}
