import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'data.dart';
import 'profile.dart';
import 'login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late Future<List<Map<String, dynamic>>> _earthquakeData;

  @override
  void initState() {
    super.initState();
    _earthquakeData = fetchEarthquakeData();
  }

  Future<List<Map<String, dynamic>>> fetchEarthquakeData() async {
    final response = await http.get(
        Uri.parse('https://data.bmkg.go.id/DataMKG/TEWS/gempaterkini.json'));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      List<Map<String, dynamic>> gempa =
          List<Map<String, dynamic>>.from(jsonData['Infogempa']['gempa']);
      return gempa;
    } else {
      throw Exception('Failed to load earthquake data');
    }
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void SignUserOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Informasi Gempa', style: TextStyle(color: Color(0xFF12283D))),
        backgroundColor:
            Colors.white, // Change app bar background color to white
      ),
      body: _getBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Color(0xFF12283D),
        unselectedItemColor: Colors.grey,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            label: 'Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          SignUserOut(context);
        },
        child: Icon(Icons.logout),
        backgroundColor:
            Color(0xFF12283D), // Change logout button background color
      ),
    );
  }

  Widget _getBody() {
    switch (_currentIndex) {
      case 0:
        return _buildHomePage();
      case 1:
        return DataPage();
      case 2:
        return ProfilePage();
      default:
        return Container();
    }
  }

  Widget _buildHomePage() {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _earthquakeData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
              child: Text('Error: ${snapshot.error}',
                  style: TextStyle(color: Color(0xFF12283D))));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
              child: Text('No earthquake data available',
                  style: TextStyle(color: Color(0xFF12283D))));
        } else {
          List<Map<String, dynamic>> earthquakes = snapshot.data ?? [];

          // Ensure not to cut down data if it's less than 10
          int startIndex = 0;
          int endIndex = earthquakes.length > 10 ? 10 : earthquakes.length;

          return ListView.builder(
            itemCount: endIndex - startIndex,
            itemBuilder: (context, index) {
              int dataIndex = startIndex + index;
              return Card(
                margin: EdgeInsets.all(8.0),
                color: Colors.white,
                child: ListTile(
                  title: Text(
                      'Magnitude: ${earthquakes[dataIndex]['Magnitude']}',
                      style: TextStyle(color: Color(0xFF12283D))),
                  subtitle: Text(
                    'Tanggal: ${earthquakes[dataIndex]['Tanggal']} | Jam: ${earthquakes[dataIndex]['Jam']}',
                    style: TextStyle(color: Color(0xFF12283D)),
                  ),
                  onTap: () {
                    _showEarthquakeDetails(earthquakes[dataIndex]);
                  },
                ),
              );
            },
          );
        }
      },
    );
  }

  void _showEarthquakeDetails(Map<String, dynamic> earthquake) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Informasi Gempa',
              style: TextStyle(color: Color(0xFF12283D))),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Magnitude: ${earthquake['Magnitude']}'),
                Text('Tanggal: ${earthquake['Tanggal']}'),
                Text('Jam: ${earthquake['Jam']}'),
                Text('Kedalaman: ${earthquake['Kedalaman']}'),
                Text('Wilayah: ${earthquake['Wilayah']}'),
                Text('Potensi: ${earthquake['Potensi']}'),
                SizedBox(height: 10),
                Text(
                  'Apa itu Gempa?',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xFF12283D)),
                ),
                Text(
                  'Gempa bumi adalah getaran yang terjadi di permukaan bumi '
                  'akibat dari pelepasan energi di dalam bumi. Getaran ini bisa '
                  'disebabkan oleh pergeseran lempeng tektonik, aktivitas gunung '
                  'api, atau aktivitas manusia seperti pengeboran minyak dan gas.',
                  style: TextStyle(color: Color(0xFF12283D)),
                ),
                SizedBox(height: 10),
                Text(
                  'Langkah-langkah jika Terjadi Gempa:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xFF12283D)),
                ),
                Text(
                  '1. Tetap tenang dan hindari panik.\n'
                  '2. Cari tempat yang aman, hindari jendela, dinding, dan benda berat.\n'
                  '3. Jika berada di dalam ruangan, berlindung di bawah meja atau tempat yang kokoh.\n'
                  '4. Jika berada di luar ruangan, hindari bangunan dan pohon tinggi.\n'
                  '5. Jangan berlari-lari atau keluar gedung dengan panik.',
                  style: TextStyle(color: Color(0xFF12283D)),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close', style: TextStyle(color: Color(0xFF12283D))),
            ),
          ],
        );
      },
    );
  }
}
