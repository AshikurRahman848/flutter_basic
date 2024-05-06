import 'package:flutter/material.dart';
import 'package:flutter_basic/pages/colors.dart';
import 'package:flutter_basic/pages/mydrawer.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: tdBlue,
        title: const Text(
          "About Me",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        // leading: Container(),
        // backgroundColor: tdBGColor,
        // actions: [],
        // title:  Row(
        //   children: [
        //     const Icon(
        //       Icons.menu,
        //       color: tdBlack,
        //       size: 30,
        //     ),
        //     Container(
        //       height: 40,
        //       width: 40,
        //       child: ClipRRect(child: Image.asset('assets/image/profile.jpeg'),),
        //     ),
        //   ],
        // ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/image/profile.jpeg'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('Md. Ashikur Rahman'),
            // subtitle: Text('Bitto'),
          ),
          const ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
            subtitle: Text('ashikurbitto@gmail.com'),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Status'),
            // subtitle: Text('Active'),
            trailing: Switch(
              value: isSelected,
              onChanged: (value) {
                setState(() {
                  isSelected = !isSelected;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
