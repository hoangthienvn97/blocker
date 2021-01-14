import 'package:flutter/material.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/localizations.dart';
import 'package:phone_blocker/resources/text_styles.dart';

class DescriptionReport extends StatefulWidget {
  Function(bool, String) onDescriptionChaned;

  DescriptionReport({this.onDescriptionChaned});
  @override
  _DescriptionReportState createState() =>
      _DescriptionReportState(onDescriptionChaned: onDescriptionChaned);
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
                child: Text(Localized.get.reportDescription,
                    style: TextStyles.Subtitle2),
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Text(
                      "$charLength/100 ${Localized.get.reportCharacters}",
                      style: TextStyles.Caption.apply(
                          color: AppColors.PLACE_HOLDER),
                    )),
              ),
            )
          ],
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
              hintText: Localized.get.reportAddDescription,
            ),
          ),
        ),
      ],
    );
  }
}
