import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Placeholder data for the TextFields
    String namaLengkap = 'Muhamad Faishal';
    String username = 'Faishal';
    String password = '1234';
    String email = 'muhamadfaishal@gmail.com';
    String nomorTelepon = '08967543214';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
          style:
              TextStyle(color: Color(0xFF12283D)), // Mengubah warna teks title
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF12283D)), // Ubah warna tuisan
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            // CircleAvatar(
            //   radius: 60.0,
            //   backgroundImage: AssetImage('assets/images/saya.jpeg'),
            // ),
            SizedBox(height: 20.0),
            Text(
              namaLengkap,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                style: TextStyle(color: Color(0xFF12283D)),
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  labelStyle: TextStyle(color: Color(0xFF12283D)),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF12283D)),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF12283D)),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                controller: TextEditingController(text: namaLengkap),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                style: TextStyle(color: Color(0xFF12283D)),
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Color(0xFF12283D)),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF12283D)),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF12283D)),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                controller: TextEditingController(text: username),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                style: TextStyle(color: Color(0xFF12283D)),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Color(0xFF12283D)),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF12283D)),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF12283D)),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                controller: TextEditingController(text: password),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                style: TextStyle(color: Color(0xFF12283D)),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Color(0xFF12283D)),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF12283D)),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF12283D)),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                controller: TextEditingController(text: email),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                style: TextStyle(color: Color(0xFF12283D)),
                decoration: InputDecoration(
                  labelText: 'Nomor Telepon',
                  labelStyle: TextStyle(color: Color(0xFF12283D)),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF12283D)),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF12283D)),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                controller: TextEditingController(text: nomorTelepon),
              ),
            ),
            SizedBox(height: 40.0),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 20.0), // Atur jarak di sini
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Simpan'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF12283D)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(
                    Size(double.infinity, 50),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
