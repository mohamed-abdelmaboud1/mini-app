import 'package:flutter/material.dart';

class HeroExample extends StatefulWidget {
  const HeroExample({super.key});

  @override
  _HeroExampleState createState() => _HeroExampleState();
}

class _HeroExampleState extends State<HeroExample> {
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
              appBar: AppBar(title: const Text('Hero Animation')),
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
}
