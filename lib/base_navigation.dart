import 'package:flutter/material.dart';
import 'favorites.dart';
import 'settings.dart';
import 'randomFacts.dart';
import 'page3.dart';
import 'homepage.dart';

class BaseNavigation {
  final BuildContext context;

  BaseNavigation(this.context);

  void showFavorites(String categoryName) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            FavoritesPage(categoryName: categoryName, context: context),
      ),
    );
  }

  void showSettings(String category) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            SettingsPage(categoryName: category, context: context),
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

  void showFactsPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RandomFactsPage(),
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

  Scaffold buildBaseNavigation(
      {required Widget body, VoidCallback? onRefresh}) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: buildDrawer(),
      body: body,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      floatingActionButton: onRefresh != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: FloatingActionButton(
                    heroTag: null,
                    child: Icon(Icons.repeat),
                    onPressed: onRefresh,
                  ),
                )
              ],
            )
          : null,
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
            showFavorites('User Favorites');
          } else if (index == 2) {
            showSettings(
                'User settings'); // You may need to provide a default category here
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
              color: Color.fromARGB(255, 219, 235, 248),
            ),
            child: Text(
              'PetPalette Menu',
              style: TextStyle(
                color: const Color.fromARGB(255, 53, 52, 52),
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Homepage'),
            onTap: showHomePage,
          ),
          ListTile(
            title: Text('Random Facts'),
            onTap: showFactsPage,
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
