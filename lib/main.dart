import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import './widgets/code_output.dart';

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
  String _fontName = 'Montserrat';
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  // ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

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
                print(pickerColor.toString());
                _fontName = fontName;
                print('Helooooooo $_fontName');
                print('Helooooooo2 $_fontName');
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              print("button raised");
              // return AlertDialog(
              //   title: const Text('Pick a color!'),
              // content: SingleChildScrollView(
              //   child: ColorPicker(
              //     pickerColor: pickerColor,
              //     onColorChanged: changeColor,
              //     showLabel: true,
              //     pickerAreaHeightPercent: 0.8,
              //   ),

              // ),
              //   actions: <Widget>[
              // TextButton(
              //   child: const Text('Got it'),
              //   onPressed: () {
              //     setState(() => currentColor = pickerColor);
              //     Navigator.of(context).pop();
              //   },
              // ),
              //   ],
              // );
              return showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('Pick a color!'),
                  content: SingleChildScrollView(
                    child: ColorPicker(
                      pickerColor: pickerColor,
                      onColorChanged: changeColor,
                      showLabel: true,
                      pickerAreaHeightPercent: 0.8,
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Got it'),
                      onPressed: () {
                        setState(() => currentColor = pickerColor);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            },
            child: Text('Change Color'),
          ),
          Flexible(
            child: Center(
              child: Text(
                _fontName,
                style: GoogleFonts.asMap()[_fontName](
                  color: pickerColor,
                  fontSize: 64,
                  fontWeight: FontWeight.w200,
                  letterSpacing: 5,
                ),
              ),
            ),
          ),
          CodeOutput(
            fontName: _fontName,
            fontColor: pickerColor.toString(),
          ),
        ],
      ),
    );
  }
}
