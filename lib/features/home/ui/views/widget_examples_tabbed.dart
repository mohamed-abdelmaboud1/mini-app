import 'package:flutter/material.dart';
import 'package:mini_app/features/home/ui/views/absorb_pointer_example.dart';
import 'package:mini_app/features/home/ui/views/autocomplete_basic_user_example.dart';
import 'package:mini_app/features/home/ui/views/baseline_example.dart';
import 'package:mini_app/features/home/ui/views/drag_target_example.dart';
import 'package:mini_app/features/home/ui/views/draggable_example.dart';
import 'package:mini_app/features/home/ui/views/fractionally_sized_box_example.dart';
import 'package:mini_app/features/home/ui/views/hero_example.dart';
import 'package:mini_app/features/home/ui/views/limited_box_example.dart';

import 'dismissible_example.dart';

class ExampleTabbedView extends StatelessWidget {
  final String title;
  final String code;
  final Widget preview;

  const ExampleTabbedView({
    super.key,
    required this.title,
    required this.code,
    required this.preview,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: () => Navigator.pop(context)),
          title: Text(title),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Code'),
              Tab(text: 'Preview'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ExampleCodeView(code: code),
            ExamplePreviewView(preview: preview),
          ],
        ),
      ),
    );
  }
}

class ExampleCodeView extends StatelessWidget {
  final String code;
  const ExampleCodeView({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: SelectableText(code, style: const TextStyle(fontSize: 14)),
    );
  }
}

class ExamplePreviewView extends StatelessWidget {
  final Widget preview;
  const ExamplePreviewView({super.key, required this.preview});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(16.0), child: preview);
  }
}

// Individual tab views using the reusable ExampleTabbedView

class AutocompleteTabView extends StatelessWidget {
  const AutocompleteTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleTabbedView(
      title: 'Autocomplete Example',
      code: '''import 'package:flutter/material.dart';
import 'package:mini_app/features/home/data/user.dart';

class AutocompleteBasicUserExample extends StatelessWidget {
  const AutocompleteBasicUserExample({super.key});

  static const List<User> _userOptions = <User>[
    User(name: 'Alice', email: 'alice@example.com'),
    User(name: 'Bob', email: 'bob@example.com'),
    User(name: 'Charlie', email: 'charlie123@gmail.com'),
  ];

  static String _displayStringForOption(User option) => option.email;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<User>(
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
            return TextFormField(
              controller: textEditingController,
              focusNode: focusNode,
              onFieldSubmitted: (String value) {
                onFieldSubmitted();
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter email',
              ),
            );
          },
      displayStringForOption: _displayStringForOption,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<User>.empty();
        }
        return _userOptions.where((User option) {
          return option.email.toString().contains(
            textEditingValue.text.toLowerCase(),
          );
        });
      },
      onSelected: (User selection) {
        debugPrint('You just selected \${_displayStringForOption(selection)}');
      },
    );
  }
}''',
      preview: const AutocompleteBasicUserExample(),
    );
  }
}

class AbsorbPointerTabView extends StatelessWidget {
  const AbsorbPointerTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleTabbedView(
      title: 'AbsorbPointer Example',
      code: '''import 'package:flutter/material.dart';

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
            IgnorePointer(
              ignoring: true,
              child: Container(
                color: Colors.black.withOpacity(0.3),
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
}''',
      preview: const AbsorbPointerExample(),
    );
  }
}

class DismissibleTabView extends StatelessWidget {
  const DismissibleTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleTabbedView(
      title: 'Dismissible Example',
      code: '''import 'package:flutter/material.dart';

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
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Item \${items[index]} dismissed to the right'),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Item \${items[index]} dismissed to the left'),
                ),
              );
            }
            setState(() {
              items.removeAt(index);
            });
          },
          child: ListTile(title: Text('Item \${items[index]}')),
        );
      },
    );
  }
}''',
      preview: const DismissibleExample(),
    );
  }
}

class DragTargetTabView extends StatelessWidget {
  const DragTargetTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleTabbedView(
      title: 'DragTarget Example',
      code: '''import 'package:flutter/material.dart';

class DragTargetExample extends StatefulWidget {
  const DragTargetExample({super.key});

  @override
  DragTargetExampleState createState() => DragTargetExampleState();
}

class DragTargetExampleState extends State<DragTargetExample> {
  Color caughtColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Draggable<Color>(
          data: Colors.blue,
          feedback: Container(
            width: 50,
            height: 50,
            color: Colors.blue.withOpacity(0.7),
          ),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 50),
        DragTarget<Color>(
          onWillAcceptWithDetails: (color) => true,
          onAcceptWithDetails: (details) {
            setState(() {
              caughtColor = details.data;
            });
          },
          onLeave: (data) {
            debugPrint('onLeave: \$data');
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
}''',
      preview: const DragTargetExample(),
    );
  }
}

class DraggableTabView extends StatelessWidget {
  const DraggableTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleTabbedView(
      title: 'Draggable Example',
      code: '''import 'package:flutter/material.dart';

class DraggableExample extends StatefulWidget {
  const DraggableExample({super.key});

  @override
  State<DraggableExample> createState() => DraggableExampleState();
}

class DraggableExampleState extends State<DraggableExample> {
  int acceptedData = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Draggable<int>(
          data: 10,
          feedback: Container(
            color: Colors.deepOrange,
            height: 100,
            width: 100,
            child: const Icon(Icons.directions_run),
          ),
          childWhenDragging: Container(
            height: 100.0,
            width: 100.0,
            color: Colors.pinkAccent,
            child: const Center(child: Text('Child When Dragging')),
          ),
          child: Container(
            height: 100.0,
            width: 100.0,
            color: Colors.lightGreenAccent,
            child: const Center(child: Text('Draggable')),
          ),
        ),
        DragTarget<int>(
          builder: (
            BuildContext context,
            List<dynamic> accepted,
            List<dynamic> rejected,
          ) {
            return Container(
              height: 100.0,
              width: 100.0,
              color: Colors.cyan,
              child: Center(
                child: Text('Value is updated to: \$acceptedData'),
              ),
            );
          },
          onAcceptWithDetails: (DragTargetDetails<int> details) {
            setState(() {
              acceptedData += details.data;
            });
          },
        ),
      ],
    );
  }
}''',
      preview: const DraggableExample(),
    );
  }
}

class HeroTabView extends StatelessWidget {
  const HeroTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleTabbedView(
      title: 'Hero Example',
      code: '''import 'package:flutter/material.dart';

class HeroExample extends StatefulWidget {
  const HeroExample({super.key});

  @override
  HeroExampleState createState() => HeroExampleState();
}

class HeroExampleState extends State<HeroExample> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Tap to view image'),
      leading: Hero(
        tag: 'hero-image',
        child: Image.network(
          'https://static.wikia.nocookie.net/cartoons/images/e/ed/Profile_-_SpongeBob_SquarePants.png/revision/latest?cb=20240420115914',
          width: 50,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(
                leading: BackButton(onPressed: () {
                  Navigator.pop(context);
                }),
                title: const Text('Hero Animation'),
              ),
              body: Center(
                child: Hero(
                  tag: 'hero-image',
                  child: Image.network(
                    'https://static.wikia.nocookie.net/cartoons/images/e/ed/Profile_-_SpongeBob_SquarePants.png/revision/latest?cb=20240420115914',
                    width: 300,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}''',
      preview: const HeroExample(),
    );
  }
}

class BaselineTabView extends StatelessWidget {
  const BaselineTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleTabbedView(
      title: 'Baseline Example',
      code: '''import 'package:flutter/material.dart';

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
}''',
      preview: const BaselineExample(),
    );
  }
}

class FractionallySizedBoxTabView extends StatelessWidget {
  const FractionallySizedBoxTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleTabbedView(
      title: 'FractionallySizedBox Example',
      code: '''import 'package:flutter/material.dart';

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
}''',
      preview: const FractionallySizedBoxExample(),
    );
  }
}

class LimitedBoxTabView extends StatelessWidget {
  const LimitedBoxTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleTabbedView(
      title: 'LimitedBox Example',
      code: '''import 'package:flutter/material.dart';

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
}''',
      preview: const LimitedBoxExample(),
    );
  }
}
