import 'package:flutter/material.dart';
import 'package:flutter_basic/pages/hometab.dart';
import 'package:flutter_basic/pages/mydrawer.dart';
import 'package:flutter_basic/pages/profiletab.dart';
import 'package:flutter_basic/pages/searchtab.dart';
import 'package:flutter_basic/pages/todolisttab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  void setSelectedIndex(int currentIndex) {
    setState(() {
      selectedIndex = currentIndex;
    });
  }

  List screenlist = [
    const TodoListTab(),
    const HomeTab(),
    const SearchTab(),
    const ProfileTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     "",
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   backgroundColor: Colors.blue,
      //   iconTheme: const IconThemeData(color: Colors.white),
      // ),
      drawer: const MyDrawer(),
      body: screenlist[selectedIndex],
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: const Color.fromARGB(255, 3, 11, 19),
        backgroundColor: Colors.blue,
        unselectedFontSize: 13,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'To-Do',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.water_damage_outlined),
            label: 'Weather',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.api),
            label: 'Api',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor:
            Colors.white, // Set the selected item text color to white
        // currentIndex: _selectedIndex,
        // onTap: _onItemTapped,
        onTap: (index) {
          setSelectedIndex(index);
        },
      ),
    );
  }
}
