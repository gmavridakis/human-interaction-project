import 'package:flutter/material.dart';
import 'favorites.dart';
import 'settings.dart';
import 'page2.dart';
import 'page3.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _url;
  late String _category;
  final String _catApiURL = 'http://shibe.online/api/cats';
  final String _dogApiURL = 'https://api.thedogapi.com/v1/images/search';

  List<String> _favorites = [];

  @override
  void initState() {
    super.initState();
    _url =
        'https://cdn.shibe.online/cats/7e788e792e7f0181a0d7716e2ffa0b5fc9ecfc0c.jpg';
    _category = 'cat';
  }

  Future<void> makeRequest() async {
    final String apiURL = _category == 'cat' ? _catApiURL : _dogApiURL;

    try {
      final response = await http.get(Uri.parse(apiURL));

      if (response.statusCode == 200) {
        // Assuming the API response is a JSON array of image URLs
        final List<dynamic> data = jsonDecode(response.body);

        if (data.isNotEmpty) {
          setState(() {
            _url = data[0]['url'];
          });
        }
      } else {
        // Handle the error
        print('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      print('An error occurred: $e');
    }
  }

  void changeCategory() {
    Future.microtask(() {
      print(
          'Changing category from $_category to ${_category == 'cat' ? 'dog' : 'cat'}');
      setState(() {
        _category = _category == 'cat' ? 'dog' : 'cat';
      });
      makeRequest();
    });
  }

  void addToFavorites() {
    // ... (same as your existing addToFavorites method)
  }

  void showFavorites() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FavoritesPage(favorites: _favorites),
      ),
    );
  }

  void showSettings() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SettingsPage(categoryName: _category),
      ),
    );
  }

  void showHomePage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  void showPage2() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Page2(),
      ),
    );
  }

  void showPage3() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Page3(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: buildDrawer(),
      body: GestureDetector(
        onDoubleTap: addToFavorites,
        child: Container(
          child: Image.network(
            _url,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: FloatingActionButton(
              heroTag: null,
              child: Icon(Icons.repeat),
              onPressed: changeCategory,
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            showHomePage();
          } else if (index == 1) {
            showFavorites();
          } else if (index == 2) {
            showSettings();
          }
        },
      ),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 48, 77, 100),
            ),
            child: Text(
              'PetPalette Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Homepage'),
            onTap: showHomePage,
          ),
          ListTile(
            title: Text('Page 2'),
            onTap: showPage2,
          ),
          ListTile(
            title: Text('Page 3'),
            onTap: showPage3,
          ),
        ],
      ),
    );
  }
}
