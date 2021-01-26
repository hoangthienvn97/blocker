import 'package:flutter/material.dart';
import 'package:phone_blocker/resources/text_styles.dart';

class ButtonSecondary extends StatelessWidget {
  final Function onTap;
  final Color background;
  final Color textColor;
  final String label;
  final Color borderColor;

  const ButtonSecondary(
      {Key key,
      @required this.onTap,
      @required this.background,
      this.label,
      this.textColor,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: SizedBox(
        height: 48,
        child: FlatButton(
          minWidth: double.infinity,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
              side: BorderSide(color: borderColor)),
          color: background,
          textColor: textColor,
          onPressed: onTap,
          child: Text(
            label.toUpperCase(),
            style: TextStyles.Button.apply(color: textColor),
          ),
        ),
      ),
    );
  }
}

class ButtonLogin extends StatelessWidget {
  final Function onTap;
  final Color background;
  final Color textColor;
  final String label;
  final Color borderColor;
  final Image image;

  const ButtonLogin(
      {Key key,
      @required this.onTap,
      @required this.background,
      this.label,
      this.textColor,
      this.borderColor,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: Padding(
        padding: const EdgeInsets.only(right: 32.0, left: 32),
        child: RaisedButton.icon(
          highlightColor: Colors.transparent,
          onPressed: onTap,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              side: BorderSide(color: borderColor)),
          icon: image,
          label: Text(
            label.toUpperCase(),
            style: TextStyles.Button.apply(color: textColor),
          ),
          textColor: Colors.white,
          splashColor: Colors.transparent,
          color: background,
        ),
      ),
    );
  }
}

class ButtonAction extends StatelessWidget {
  final Function onTap;
  final Color background;
  final Color textColor;
  final String label;
  final Color borderColor;

  const ButtonAction({
    Key key,
    @required this.onTap,
    @required this.background,
    this.label,
    this.textColor,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
            side: BorderSide(color: borderColor)),
        onPressed: onTap,
        color: background,
        textColor: textColor,
        child: Text(
          label.toUpperCase(),
          style: TextStyles.Button.apply(color: textColor),
        ),
      ),
    );
  }
}
