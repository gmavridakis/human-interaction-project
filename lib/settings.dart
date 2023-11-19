import 'package:flutter/material.dart';
import 'base_navigation.dart';

class SettingsPage extends StatelessWidget {
  final String categoryName;
  final BaseNavigation _baseNavigation;

  SettingsPage({required this.categoryName, required BuildContext context})
      : _baseNavigation = BaseNavigation(context);

  @override
  Widget build(BuildContext context) {
    return _baseNavigation.buildBaseNavigation(
      body: Center(
        child: Text(
          'Hello, settings $categoryName!',
          style: TextStyle(fontSize: 20),
        ),
      ),
      onRefresh: () {},
    );
  }
}
