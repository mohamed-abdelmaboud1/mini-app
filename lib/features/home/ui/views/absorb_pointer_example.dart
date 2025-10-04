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
