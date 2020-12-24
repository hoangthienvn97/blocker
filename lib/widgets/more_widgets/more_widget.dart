import 'package:flutter/material.dart';
import 'package:phone_blocker/resources/text_styles.dart';

class MoreWidget extends StatelessWidget {
  final Image image;
  final String name;
  final Function onPress;

  MoreWidget({this.image , this.name, this.onPress});  

  @override
  Widget build(BuildContext context) {
    return Container(
                    color: Colors.white,
                    child: FlatButton(
                      onPressed: onPress,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: image,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text(
                              name.toUpperCase(), style: TextStyles.Button,),
                            ),
                        ],
                      ),
                    ),
                  );
  }
}