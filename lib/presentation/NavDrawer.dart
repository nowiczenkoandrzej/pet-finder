import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.all(4), children: [
      const DrawerHeader(
        child: Text('Pet Finder'),
      ),
      ListTile(
        onTap: () {},
        title: Text('Favourites'),
      ),
      ListTile(
        onTap: () {},
        title: Text('All'),
      ),
      ListTile(
        onTap: () {},
        title: Text('Cats'),
      ),
      ListTile(
        onTap: () {},
        title: Text('Dogs'),
      ),
      ListTile(
        onTap: () {},
        title: Text('Organizations'),
      ),
    ]));
  }
}
