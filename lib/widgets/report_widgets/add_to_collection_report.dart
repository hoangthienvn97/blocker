import 'package:flutter/material.dart';
import 'package:phone_blocker/core/common/assets.dart';

class AddToCollectionReport extends StatefulWidget {
  Function(bool) onOptionChanged;

  AddToCollectionReport({this.onOptionChanged});
  @override
  _AddToCollectionReportState createState() => _AddToCollectionReportState(onOptionChanged: onOptionChanged);
}

class _AddToCollectionReportState extends State<AddToCollectionReport> {

  Function(bool) onOptionChanged;

  _AddToCollectionReportState({this.onOptionChanged});

  String _option;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Add to collection",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          children: ["option1", "option 2", "option 3"]
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.only(right : 16.0),
                  child: Card(
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      title: Text(e),
                      leading: Radio(
                        value: e,
                        groupValue: _option,
                        onChanged: (String value) {
                          setState(() {
                            _option = value;
                            onOptionChanged.call(_option != null);
                          });
                        },
                      ),
                      trailing: Image.asset(Assets.ICON_AVA),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
