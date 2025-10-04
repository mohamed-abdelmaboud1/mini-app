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
              HeroExample(),
              const SizedBox(height: 20),
              BaselineExample(),
              const SizedBox(height: 20),
              FractionallySizedBoxExample(),
              const SizedBox(height: 20),
              LimitedBoxExample(),
              const SizedBox(height: 20),
              OffstageExample(),
              const SizedBox(height: 20),

              Text(
                'End of Examples',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
