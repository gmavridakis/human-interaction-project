import 'package:flutter/material.dart';
import 'base_navigation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _url;
  late String _category;
  final List<String> _catImageURLs = [
    'https://cdn.shibe.online/cats/7e788e792e7f0181a0d7716e2ffa0b5fc9ecfc0c.jpg',
    'https://cdn.shibe.online/cats/a8da965d8118cbd9593ab30c5179cf275e11927e.jpg',
    'https://cdn.shibe.online/cats/3da221a9bdc3269aaa40679131ffb0c75143214f.jpg',
    'https://cdn.shibe.online/cats/cad2cfcc1c152c5911cd54ff745206c023401f71.jpg',
    'https://cdn.shibe.online/cats/8027e8d04de58a4bcd31f7b3a159b63305e3e391.jpg',
    'https://cdn.shibe.online/cats/6ae35b5dee035e016c8080405a9bb0902a40d582.jpg',
  ];
  int _catImageIndex = 0;
  late BaseNavigation _baseNavigation;

  @override
  void initState() {
    super.initState();
    _url = _catImageURLs[0];
    _category = 'cat';
    _baseNavigation = BaseNavigation(context);
  }

  Future<void> makeRequest() async {
    setState(() {
      _url = _catImageURLs[_catImageIndex++ % _catImageURLs.length];
    });
  }

  void changeCategory() {
    Future.microtask(() {
      setState(() {
        _category = 'cat';
      });
      makeRequest();
    });
  }

  void addToFavorites() {
    // ... (same as your existing addToFavorites method)
  }

  @override
  Widget build(BuildContext context) {
    return _baseNavigation.buildBaseNavigation(
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
      onRefresh: changeCategory,
    );
  }
}
