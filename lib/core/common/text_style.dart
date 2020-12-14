import 'package:flutter/material.dart';

class TextStyleText extends StatelessWidget {
  final String text;
  final FontWeight font_weight;
  final double font_size;
  final double letter_spacing;
  final Color color;

  TextStyleText(this.text, this.font_size, this.font_weight,
      this.letter_spacing, this.color);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'RobotoMono',
          fontStyle: FontStyle.normal,
          fontSize: font_size,
          fontWeight: font_weight,
          letterSpacing: letter_spacing,
          color: color),
    );
  }
}

class StyleTextSpan extends StatelessWidget {
  final String text;
  final FontWeight font_weight;
  final double font_size;
  final double letter_spacing;
  final Color color;

  StyleTextSpan(this.text, this.font_size, this.font_weight,
      this.letter_spacing, this.color);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <InlineSpan>[
          TextSpan(
            text: text,
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: font_weight,
              fontSize: font_size,
              letterSpacing: letter_spacing,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
