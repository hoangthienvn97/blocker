import 'package:flutter/material.dart';

class PostButton extends StatelessWidget {
  final Image image;
  final String label;
  final Function onTap;
  final Color textColor;
  final Color background;

  const PostButton(
      {Key key,
      @required this.image,
      @required this.label,
      @required this.onTap,
      @required this.background,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: background,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        height: 35.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image,
            const SizedBox(width: 4.0),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                label,
                style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: textColor,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 0.25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
