import 'package:flutter/material.dart';
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
        debugPrint('You just selected ${_displayStringForOption(selection)}');
      },
    );
  }
}
