import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_blocker/core/api/api.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/localizations.dart';
import 'package:phone_blocker/resources/text_styles.dart';
import 'package:phone_blocker/screens/report/success_report.dart';
import 'package:rate_my_app/rate_my_app.dart';
import '../../widgets/report_widgets/reports_widget.dart';
import '../../core/common/commons.dart';
import '../home.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  String dialCode = "84";
  static const platform =
      const MethodChannel('co.vacsolutions.secretbox/callBlocking');

  Future<void> _blockNumbers(phoneNumber) async {
    try {
      final result = await platform.invokeMethod('blockNumbers', {
        'numbers': [phoneNumber]
      });
      if (result == true) {
        print("Blocked " + phoneNumber.toString());
      } else {
        print(result);
      }
    } on PlatformException catch (e) {
      //batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
  }

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
        onSuccess: (numberRespone) => {
              _blockNumbers(
                  int.parse(numberRespone.data.phone.replaceAll("+", ""))),
              _rateMyApp.init().then((_) {
                if (_rateMyApp.shouldOpenDialog) {
                  _rateMyApp.showStarRateDialog(
                    context,
                    title: 'What do you think about Our App?',
                    message: 'Please leave a rating',
                    actionsBuilder: (_, stars) {
                      return [
                        FlatButton(
                          child: Text('OK'),
                          onPressed: () async {
                            print('Thanks for the ' +
                                (stars == null
                                    ? '0'
                                    : stars.round().toString()) +
                                ' star(s) !');
                            if (stars != null && (stars == 4 || stars == 5)) {
                            } else {}
                            await _rateMyApp.callEvent(
                                RateMyAppEventType.rateButtonPressed);
                            Navigator.pop<RateMyAppDialogButton>(
                                context, RateMyAppDialogButton.rate);
                          },
                        ),
                      ];
                    },
                    dialogStyle: DialogStyle(
                      titleAlign: TextAlign.center,
                      messageAlign: TextAlign.center,
                      messagePadding: EdgeInsets.only(bottom: 20.0),
                    ),
                    starRatingOptions: StarRatingOptions(),
                    onDismissed: () => _rateMyApp
                        .callEvent(RateMyAppEventType.laterButtonPressed),
                  );
                }
              }),
              navigatorPush(context, SuccessReport())
            },
        onError: (errorResponse) =>
            {Utils.showToast(context, errorResponse.data.message)});
  }

  RateMyApp _rateMyApp;
  @override
  void initState() {
    super.initState();
    _rateMyApp = RateMyApp(
        preferencesPrefix: 'rateMyApp_',
        minDays: 0,
        minLaunches: 2,
        remindDays: 2,
        remindLaunches: 2,
        googlePlayIdentifier: '',
        appStoreIdentifier: 'co.vacsolutions.secretbox');
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
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
                                  Localized.get.reportDialogTitle,
                                  style: TextStyles.Subtitle1,
                                )),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  Localized.get.reportDialogStay,
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 15),
                                ),
                              ),
                              FlatButton(
                                onPressed: () {
                                  navigatorPush(context, Home());
                                },
                                child: Text(
                                  Localized.get.reportDialogLeave,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 15),
                                ),
                              ),
                            ]);
                      })),
            ),
            titleSpacing: -10,
            centerTitle: false,
            title: Text(
              Localized.get.reportDiscard,
              style: TextStyles.Subtitle2,
            ),
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
                      child: Text(
                        Localized.get.reportTitle,
                        style: TextStyles.Headline2.apply(
                            color: AppColors.PRIMARY),
                      )),
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
                          onOptionChanged: (isValid, collectionId) => {
                            hasOption = isValid,
                            _update(),
                            id = collectionId
                          },
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
          )),
    );
  }
}
