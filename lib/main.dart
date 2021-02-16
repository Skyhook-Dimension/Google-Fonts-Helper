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
  String _fontName = 'ABeeZee';
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  TextEditingController _text = TextEditingController();
  TextEditingController _size = TextEditingController();
  String _inputString = "Enter Text";
  int _fontSize = 64;

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
                print("Indiaaaa ${_text.text}");
              });
            },
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              decoration: InputDecoration(hintText: 'Enter Text'),
              maxLines: 4,
              controller: _text,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Font Size'),
                Container(
                  width: 30,
                  height: 20,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: '64',
                    ),

                    controller: _size,
                    //initialValue: '64',
                    //keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print("button raised");

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
                  style: ElevatedButton.styleFrom(primary: pickerColor),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Chutiyaaaaaa');
                    setState(() {
                      print('Madarchod');
                      _fontSize = 18;
                      if (_text.text.isNotEmpty) {
                        print('Madarchod---- 1');
                        _inputString = _text.text;
                      }
                      if (_size.text.isNotEmpty) {
                        print('Madarchod ---- 2');
                        _fontSize = int.parse(_size.text);
                      }

                      print("Texttttttt ${_inputString}");
                      print("Sizeeeee ${_fontSize}");
                    });
                  },
                  child: Text('Generate Code'),
                )
              ],
            ),
          ),
          Flexible(
            child: Center(
              child: Text(
                _inputString,
                style: GoogleFonts.asMap()[_fontName](
                  color: pickerColor,
                  fontSize: _fontSize.toDouble(),
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
