import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magichiberus/ui/widgets/home_page/InfoCard.dart';

class HomePage extends StatelessWidget{

  var nombre = 'Jesus Ortiz';
  var email = 'jesusortiz@hotmail.com';
  var phone = '648 44 70 82';
  var linkedin = 'jesus-ortiz-capellan-l94';
  var date = '19/12/2021';

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('About me'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/avatar.jpg'),
            ),
            Text(nombre,
                style: GoogleFonts.pacifico(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                color: Colors.teal.shade700,
              ),
            ),
            InfoCard(
              text: phone,
              icon: Icons.phone,
            ),
            InfoCard(
              text: email,
              icon: Icons.email,
            ),
            InfoCard(
              text: linkedin,
              icon: Icons.web,
            ),
            InfoCard(
              text: date,
              icon: Icons.date_range,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.green[200],
    );
  }
}