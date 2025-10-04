import 'package:flutter/material.dart';

class DismissibleExample extends StatefulWidget {
  const DismissibleExample({super.key});

  @override
  State<DismissibleExample> createState() => _DismissibleExampleState();
}

class _DismissibleExampleState extends State<DismissibleExample> {
  List<int> items = List<int>.generate(10, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          background: Container(color: Colors.green),
          key: ValueKey<int>(items[index]),
          direction: DismissDirection.horizontal,
          secondaryBackground: Container(color: Colors.red),
          behavior: HitTestBehavior.opaque,
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.startToEnd) {
              // start from the left to the right
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Item ${items[index]} dismissed to the right'),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Item ${items[index]} dismissed to the left'),
                ),
              );
            }
            setState(() {
              items.removeAt(index);
            });
          },
          child: ListTile(title: Text('Item ${items[index]}')),
        );
      },
    );
  }
}
