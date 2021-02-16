import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Fonts Helper',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GoogleFonts classType;
  @override
  Widget build(BuildContext context) {
    //print(GoogleFonts.asMap().values.elementAt(2));
    Function func = GoogleFonts.asMap().values.elementAt(2);

    return Scaffold(
      appBar: AppBar(
        title: Text('Google Fonts Helper'),
      ),
//       body: DropdownButton<GoogleFonts>(
//     value: classType,
//     onChanged: (GoogleFonts newValue) {
//       setState(() {
//         viewModel.classType = newValue;
//       });
//     },
//     items: GoogleFonts.values.map((GoogleFonts classType) {
//       return DropdownMenuItem<GoogleFonts>(
//         value: classType,
//         child: Text(classType.toString()));
//     }).toList();
// ),
      body: Center(
        child: Text(
          "Hello",
          style: GoogleFonts.asMap().values.elementAt(3)(
            color: Color(0xFFFFA500),
            fontSize: 64,
            fontWeight: FontWeight.w200,
            letterSpacing: -5,
          ),
        ),
      ),
    );
  }
}
