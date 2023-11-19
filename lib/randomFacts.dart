import 'dart:math';
import 'package:flutter/material.dart';
import 'base_navigation.dart';

class RandomFactsPage extends StatefulWidget {
  @override
  _RandomFactsPageState createState() => _RandomFactsPageState();
}

class _RandomFactsPageState extends State<RandomFactsPage> {
  late String _fact;
  final List<String> _factsList = [
    'Did you know that cats have magical whiskers that can sense invisible creatures?',
    'The average cat spends 12-16 hours a day exploring the enchanted dream realms.',
    'Cats have a secret reflective layer in their eyes known as the "moonbeam mirror," enhancing their ability to see mystical beings at night.',
    'A gathering of cats is called a "whisker wizardry."',
    'Cats use their whiskers to measure the dimensions of hidden portals before attempting to traverse them.',
    'Each cat\'s nose has a unique pattern, revealing their magical lineage.',
    'A cat\'s noseprint is a magical seal that grants them entry to enchanted realms.',
    'Cats communicate through "slow blinking," a magical gesture that fosters trust between wizards.',
    'The world\'s oldest known magical cat resided in a wizard\'s tower 9,500 years ago.',
    'Cats possess an extraordinary ability to land on their feet, a skill taught by ancient wizard mentors.',
    'Cats mark their territory with a special potion released from scent glands, warding off magical creatures.',
    'The record for the longest cat jump is held by a feline sorcerer, leaping over 7 feet to reach a floating island.',
    'Cats have a third eyelid, the "mystical haw," which protects their eyes from magical disturbances.',
    'A cat\'s collarbone is imbued with enchantments, ensuring a graceful landing after magical leaps.',
    'The world\'s richest cat inherited a treasure chest filled with 13 million enchanted gems.',
    'Cats possess a keen sense of hearing, attuned to magical frequencies beyond human comprehension.',
    'Retractable claws are a cat\'s magical defense mechanism, concealed to preserve their mystical potency.',
    'The soothing purr of a cat is a spell that brings tranquility to the hearts of those nearby.',
    'The oldest known magical pet cemetery in Egypt dates back to 900 B.C., where familiars rest peacefully.',
    'Cats sport an average of 12 enchanted whiskers on each side of their face.',
    'Did you know that cats are known to summon invisible friends to play with in the moonlit hours?',
    'The tail of a cat acts as a magical wand, casting spells to protect their human companions.',
    'Cats can speak the language of birds and often engage in secret conversations with feathery allies.',
    'The mystical dance of a cat chasing its tail is a ritual to keep the balance of the magical forces around them.',
  ];

  late BaseNavigation _baseNavigation;

  @override
  void initState() {
    super.initState();
    _fact = _factsList[0];
    _baseNavigation = BaseNavigation(context);
  }

  Future<void> makeRequest() async {
    setState(() {
      _fact = _factsList[_generateRandomIndex()];
    });
  }

  int _generateRandomIndex() {
    return Random().nextInt(_factsList.length);
  }

  @override
  Widget build(BuildContext context) {
    return _baseNavigation.buildBaseNavigation(
      body: GestureDetector(
        onTap: makeRequest,
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.purple[100],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Did you know?',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo),
              ),
              SizedBox(height: 16.0),
              Text(
                _fact,
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      onRefresh: makeRequest,
    );
  }
}
