import 'package:flutter/material.dart';
import 'feedpage.dart';
import 'upload_photo.dart';

class RandomFactsPage extends StatefulWidget {
  @override
  _RandomFactsPageState createState() => _RandomFactsPageState();
}

class _RandomFactsPageState extends State<RandomFactsPage> {
  static const Color primaryColor = Color.fromRGBO(22, 128, 90, 1);
  static const Color secondaryColor = Color.fromRGBO(0, 67, 112, 1);
  static const Color backgroundColor = Colors.black;
  static const Color textColor = Colors.white;
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

  bool _factVisible = true;

  int counter = 0;
  @override
  void initState() {
    super.initState();
    _fact = _factsList[counter];
  }

  void updateFact() {
    counter++;
    if (counter > 23) {
      counter = 0;
    }
    _fact = _factsList[counter];
  }

  Future<void> makeRequest() async {
    setState(() {
      updateFact();
    });
  }

  void toggleFactVisibility() {
    setState(() {
      _factVisible = true; //!_factVisible;
    });
    if (_factVisible) updateFact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Random Facts',
          style: TextStyle(
            color: Color.fromRGBO(22, 128, 90, 1),
          ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
            color: Color.fromRGBO(
                22, 128, 90, 1)), // #16805A // App bar background color
      ),
      body: GestureDetector(
        onTap: makeRequest,
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: _factVisible ? 1.0 : 1.0,
                duration: Duration(milliseconds: 500),
                child: Text(
                  'Did you know?',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              AnimatedOpacity(
                opacity: _factVisible ? 1.0 : 1.0,
                duration: Duration(milliseconds: 500),
                child: Text(
                  _fact,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: FloatingActionButton(
              heroTag: null,
              child: Icon(Icons.repeat),
              onPressed: makeRequest,
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white), // Icon color
            label: '',
          ),
          BottomNavigationBarItem(
            icon:
                Icon(Icons.camera_alt_sharp, color: Colors.white), // Icon color
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline_rounded,
                color: const Color(0xFF16805A)), // Icon color
            label: '',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            showFeed();
          } else if (index == 1) {
            uploadPhoto();
          } else if (index == 2) {
            showFacts();
          }
        },
        backgroundColor: Colors.black,
        selectedItemColor: Color(0xFF16805A),
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  void showFeed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FeedPage(),
      ),
    );
  }

  void uploadPhoto() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UploadPhotoPage(),
      ),
    );
  }

  void showFacts() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RandomFactsPage(),
      ),
    );
  }
}
