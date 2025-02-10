import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        onTap: () {
          //context.push('/');
        },
        title: Text('Favourites'),
      ),
      ListTile(
        onTap: () {
          context.push('/');
        },
        title: Text('All'),
      ),
      ListTile(
        onTap: () {
          context.push('/cats');
        },
        title: Text('Cats'),
      ),
      ListTile(
        onTap: () {
          context.push('/dogs');
        },
        title: Text('Dogs'),
      ),
      ListTile(
        onTap: () {},
        title: Text('Organizations'),
      ),
    ]));
  }
}
