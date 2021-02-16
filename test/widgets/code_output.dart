import 'package:flutter/material.dart';
import 'package:syntax_highlighter/syntax_highlighter.dart';
import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';

class CodeOutput extends StatelessWidget {
  final String fontName;
  String fontSize;
  String fontWeight;
  String fontSpacing;

  CodeOutput(
      {@required this.fontName,
      this.fontSize = "15",
      this.fontSpacing = "5",
      this.fontWeight = "200"});

  String _exampleCode = ''' Text(
        "Hello",
        style: GoogleFonts.abhayaLibre(
          color: Color(0xFFFFA500),
          fontSize: 64,
          fontWeight: FontWeight.w200,
          letterSpacing: -5,
        ),
      ), ''';

  @override
  Widget build(BuildContext context) {
    final SyntaxHighlighterStyle style =
        SyntaxHighlighterStyle.darkThemeStyle();
    return Scaffold(
        appBar: AppBar(
          title: Text("sdbns"),
        ),
        body: Container(
          color: Colors.black,
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
                        DartSyntaxHighlighter(style).format(_exampleCode),
                      ],
                    ),
                  ),
                  FlatButton(
                      onPressed: () {
                        Clipboard.setData(
                            new ClipboardData(text: _exampleCode));
                      },
                      child: Icon(
                        Icons.copy,
                        color: Colors.amber,
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
