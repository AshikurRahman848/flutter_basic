import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_basic/pages/colors.dart';
import 'package:flutter_basic/pages/mydrawer.dart';
import 'package:http/http.dart' as http;

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  Map<String, dynamic>? _weatherData;
  String? _selectedDivision;

  @override
  void initState() {
    super.initState();
    _selectedDivision = divisions[0];
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$_selectedDivision?unitGroup=us&key=Q3J2P4YNHHTCA32YN39F6EXUH&contentType=json'));
    if (response.statusCode == 200) {
      setState(() {
        _weatherData = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  double fahrenheitToCelsius(double fahrenheit) {
    return (5 / 9) * (fahrenheit - 32);
  }

  String formatDateTime(String dateTime) {
    DateTime parsedDate = DateTime.parse(dateTime);
    return "${parsedDate.day} ${_getMonthName(parsedDate.month)} ${parsedDate.year}";
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: tdBlue,
        title: const Text(
          "Bangladesh Weather",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _weatherData == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                DropdownButton<String>(
                  value: _selectedDivision,
                  dropdownColor: Colors.grey[200], // Set same color for all items
                  onChanged: (newValue) {
                    setState(() {
                      _selectedDivision = newValue;
                    });
                    fetchData();
                  },
                  items: divisions.map<DropdownMenuItem<String>>((division) {
                    return DropdownMenuItem<String>(
                      value: division,
                      child: Text(
                        division,
                        style: TextStyle(color: Colors.black), // Set text color
                      ),
                    );
                  }).toList(),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _weatherData!['days'].length,
                    itemBuilder: (context, index) {
                      final weatherInfo = _weatherData!['days'][index];
                      final double celsiusTemp =
                          fahrenheitToCelsius(weatherInfo['temp']);
                      return Card(
                        elevation: 2,
                        margin: EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: ListTile(
                          title: Text(formatDateTime(weatherInfo['datetime'])),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Temperature: ${celsiusTemp.toStringAsFixed(1)}°C'),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

List<String> divisions = [
  'Dhaka',
  'Chittagong',
  'Rajshahi',
  'Khulna',
  'Barisal',
  'Sylhet',
  'Rangpur',
  'Mymensingh',
];
