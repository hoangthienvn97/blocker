import 'package:flutter/material.dart';
import 'package:phone_blocker/core/api/api.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/text_styles.dart';
import 'package:phone_blocker/screens/report/success_report.dart';
import '../../widgets/report_widgets/reports_widget.dart';
import '../../core/common/commons.dart';
import '../home.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  bool isAllValid = false;

  bool isPhoneValid = false;

  String phone = "";

  bool isDescriptionValid = false;

  String description = "";

  bool hasOption = false;

  int id;

  _update() {
    setState(() {
      isAllValid = isPhoneValid && isDescriptionValid && hasOption;
    });
  }

  _report() {
    Api().postReport(phone, description, id,
        onSuccess: (numberRespone) => {navigatorPush(context, SuccessReport())},
        onError: (errorResponse) =>
            {Utils.showToast(context, errorResponse.data.message)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Transform.translate(
            offset: Offset(-5, 0),
            child: IconButton(
                icon: Image.asset(Assets.ICON_DISCARD,
                    color: AppColors.PLACE_HOLDER),
                onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          backgroundColor: Colors.white,
                          title: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Data will not be saved if you want to leave, please confirm",
                                style: TextStyles.Subtitle1,
                              )),
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
                                navigatorPush(context, Home());
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
          title: Text("Discard", style: TextStyles.Subtitle2,),
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
                  child: Text("Report a New Phone Number", style: TextStyles.Headline2.apply(color: AppColors.PRIMARY), )
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
                        onPhoneChanged: (isValid, phoneNumber) => {
                          isPhoneValid = isValid,
                          _update(),
                          phone = phoneNumber
                        },
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 5.0),
                    sliver: SliverToBoxAdapter(
                      child: DescriptionReport(
                        onDescriptionChaned: (isValid, des) => {
                          isDescriptionValid = isValid,
                          _update(),
                          description = des
                        },
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 5.0),
                    sliver: SliverToBoxAdapter(
                      child: AddToCollectionReport(
                        onOptionChanged: (isValid, collectionId) =>
                            {hasOption = isValid, _update(), id = collectionId},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () => _report(),
                child: Image.asset(this.isAllValid
                    ? Assets.IMAGE_REPORT_LIGHT
                    : Assets.IMAGE_REPORT_DARK),
              ),
            ),
          ],
        ));
  }
}
