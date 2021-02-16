import 'package:flutter/material.dart';
import 'package:syntax_highlighter/syntax_highlighter.dart';
import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';

class CodeOutput extends StatefulWidget {
  String fontName;
  String fontSize;
  String fontColor;
  String fontWeight;
  String fontSpacing;

  CodeOutput(
      {@required this.fontName,
      this.fontColor = "Colors.amber",
      this.fontSize = "15",
      this.fontSpacing = "5",
      this.fontWeight = "200"});

  @override
  _CodeOutputState createState() => _CodeOutputState();
}

class _CodeOutputState extends State<CodeOutput> {
  var isDark = false;
  String _exampleCode;
  String getexamplecode() {
    _exampleCode = ''' Text(
        "Hello",
        style: GoogleFonts.${this.widget.fontName}(
          color: ${this.widget.fontColor},
          fontSize: 64,
          fontWeight: FontWeight.w200,
          letterSpacing: -5,
        ),
      ), ''';
    return _exampleCode;
  }

  @override
  Widget build(BuildContext context) {
    final SyntaxHighlighterStyle style = isDark
        ? SyntaxHighlighterStyle.darkThemeStyle()
        : SyntaxHighlighterStyle.lightThemeStyle();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 400,
        color: isDark ? Colors.black : Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                        fontFamily: 'monospace', fontSize: 20.0),
                    children: <TextSpan>[
                      DartSyntaxHighlighter(style).format(getexamplecode()),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                        onPressed: () {
                          Clipboard.setData(
                              new ClipboardData(text: getexamplecode()));
                        },
                        child: Icon(
                          Icons.copy,
                          color: Colors.amber,
                        )),
                    FlatButton(
                        onPressed: () {
                          setState(() {
                            isDark = !isDark;
                          });
                        },
                        child: Icon(
                          Icons.lightbulb,
                          color: Colors.amber,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
