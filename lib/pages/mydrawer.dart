import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 122, 179, 226),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Text(
              'My First App',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Edit Bio'),
            onTap: () {
              
            },
          ),
          ListTile(
            title: const Text('Share'),
            onTap: () {
              
            },
          ),
          ListTile(
            title: const Text('Follow Us'),
            onTap: () {
              
            },
          ),
        ],
      ),
    );
  }
}
