import 'package:flutter/material.dart';
import 'package:phone_blocker/screens/community/community.dart';
import '../../widgets/report_widgets/reports_widget.dart';
import '../../core/common/commons.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  bool isAllValid = false;

  bool isPhoneValid = false;

  bool isDescriptionValid = false;

  bool hasOption = false;

  _update() {
    setState(() {
      isAllValid = isPhoneValid && isDescriptionValid && hasOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Transform.translate(
            offset: Offset(-5, 0),
            child: IconButton(
                icon:
                    Image.asset(Assets.ICON_DISCARD, color: Color(0xff828282)),
                onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          backgroundColor: Colors.white,
                          title: Align(
                              alignment: Alignment.center,
                              child: TextStyleText(
                                  "Data will not be saved if you want to leave, please confirm",
                                  16,
                                  FontWeight.w500,
                                  0.15,
                                  Color(0xff484848))),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "STAY",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 15),
                              ),
                            ),
                            FlatButton(
                              onPressed: () {
                                navigatorPush(context, Community());
                              },
                              child: Text(
                                "LEAVE",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 15),
                              ),
                            ),
                          ]);
                    })),
          ),
          titleSpacing: -10,
          centerTitle: false,
          title: TextStyleText(
              "Discard", 15, FontWeight.w500, 0.1, Color(0xff484848)),
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40.0),
            child: Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 24),
                child: Container(
                  height: 30,
                  alignment: Alignment.centerLeft,
                  child: TextStyleText("Report a New Phone Number", 24,
                      FontWeight.w500, 0.18, ConfigColor.TEXT),
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 8,
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverToBoxAdapter(
                      child: PhoneNumberReport(
                        onPhoneChanged: (value) =>
                            {isPhoneValid = value, _update()},
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 5.0),
                    sliver: SliverToBoxAdapter(
                      child: DescriptionReport(
                        onDescriptionChaned: (value) =>
                            {isDescriptionValid = value, _update()},
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 5.0),
                    sliver: SliverToBoxAdapter(
                      child: AddToCollectionReport(
                        onOptionChanged: (value) =>
                            {hasOption = value, _update()},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                child: Image.asset(this.isAllValid
                    ? Assets.IMAGE_REPORT_LIGHT
                    : Assets.IMAGE_REPORT_DARK),
              ),
            ),
          ],
        ));
  }
}
