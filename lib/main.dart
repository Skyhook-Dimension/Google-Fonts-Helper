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
  String _fontName = 'ABeeZee';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Fonts Helper'),
      ),
      body: Column(
        children: [
          DropdownButton(
            items: GoogleFonts.asMap()
                .map((key, value) {
                  return MapEntry(
                    key,
                    DropdownMenuItem<String>(
                      value: key,
                      child: Text(key),
                    ),
                  );
                })
                .values
                .toList(),
            value: _fontName,
            onChanged: (fontName) {
              setState(() {
                print('Heliiiiiiii $_fontName');
                _fontName = fontName;
                print('Helooooooo $_fontName');
                print('Helooooooo2 $_fontName');
              });
            },
          ),
          Flexible(
            child: Center(
              child: Text(
                _fontName,
                style: GoogleFonts.asMap()[_fontName](
                  color: Color(0xFFFFA500),
                  fontSize: 64,
                  fontWeight: FontWeight.w200,
                  letterSpacing: -5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
