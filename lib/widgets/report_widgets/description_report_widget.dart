import 'package:flutter/material.dart';
import '../../core/common/commons.dart';

class DescriptionReport extends StatefulWidget {
  Function(bool, String) onDescriptionChaned;

  DescriptionReport({this.onDescriptionChaned});
  @override
  _DescriptionReportState createState() => _DescriptionReportState(onDescriptionChaned: onDescriptionChaned);
}

class _DescriptionReportState extends State<DescriptionReport> {
  final textController = TextEditingController();
  int charLength = 0;

  Function(bool, String) onDescriptionChaned;

  _DescriptionReportState({this.onDescriptionChaned});

  _onChanged(String value) {
    onDescriptionChaned.call(value.length > 0, value);
    setState(() {
      charLength = value.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextStyleText("Description" , 14 , FontWeight.w500 , 0.1, Color(0xff484848)),
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: 
                  TextStyleText("$charLength/100 characters" , 12 , FontWeight.normal , 0.4, Color(0xff828282),
                ),
              ),
            ),
            )],
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: TextField(
            controller: textController,
            autocorrect: true,
            onChanged: _onChanged,
            maxLines: 2,
            maxLength: 100,
            decoration: new InputDecoration(
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              hintText: "Type to add description",
            ),
          ),
        ),
      ],
    );
  }
}
