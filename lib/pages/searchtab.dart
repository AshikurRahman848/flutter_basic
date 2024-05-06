import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_basic/pages/colors.dart';
import 'package:flutter_basic/pages/mydrawer.dart';
import 'package:http/http.dart' as http;

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  List<dynamic>users = [];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       drawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: tdBlue,
        title: const Text(
          "Api Call",
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
     body: ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        final name = user['name']['first'];
        final email = user['email'];
        final imageUrl = user['picture']['thumbnail'];
      return ListTile(
        leading: ClipRRect(
          borderRadius:BorderRadius.circular(100),
          child: Image.network(imageUrl),
        ),
         title : Text(name),
         subtitle:Text(email) ,
      );
     },) ,
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
        ),
    );
 
  }
     void fetchUsers () async
    {
      print ('fetchUsers called');
      const url= 'https://randomuser.me/api/?results=100';
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      final body =response.body;
      final json = jsonDecode(body);
      print (json);
      setState(() {
        users = json['results'];
      });
      print ('ferchUsers completed');
    }
}