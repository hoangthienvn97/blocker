import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_blocker/core/api/api.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/localizations.dart';
import 'package:phone_blocker/resources/text_styles.dart';
import 'package:phone_blocker/screens/report/success_report.dart';
import 'package:phone_blocker/widgets/button.dart/button.dart';
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
      const MethodChannel('co.vacsolutions.callblocker/callBlocking');

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
    } on PlatformException catch (e) {}
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
                    title: Localized.get.rateAppQuestion,
                    message: Localized.get.rateAppLeave,
                    actionsBuilder: (_, stars) {
                      return [
                        FlatButton(
                          child: Text(Localized.get.rateAppOk),
                          onPressed: () async {
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
        appStoreIdentifier: 'co.vacsolutions.callblocker');
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
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          backgroundColor: Colors.white,
                          title: Align(
                            alignment: Alignment.center,
                            child: Center(
                              child: Text(
                                Localized.get.reportDialogTitle,
                                style: TextStyles.Subtitle1,
                              ),
                            ),
                          ),
                          actions: <Widget>[
                            ButtonAction(
                                onTap: () => Navigator.pop(context),
                                label: Localized.get.reportDialogStay,
                                background: Colors.white,
                                borderColor: AppColors.PRIMARY,
                                textColor: AppColors.PRIMARY),
                            SizedBox(
                              width: 10,
                            ),
                            ButtonAction(
                                onTap: () => popToRootAndPushReplacement(
                                    context, Home()),
                                label: Localized.get.reportDialogLeave,
                                background: AppColors.PRIMARY,
                                borderColor: AppColors.PRIMARY,
                                textColor: Colors.white),
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
                      style:
                          TextStyles.Headline2.apply(color: AppColors.PRIMARY),
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
                        onOptionChanged: (isValid, collectionId) =>
                            {hasOption = isValid, _update(), id = collectionId},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ButtonSecondary(
                  onTap: () => _report(),
                  background: this.isAllValid
                      ? AppColors.PRIMARY
                      : AppColors.LIGHT_BLUE,
                  label: Localized.get.buttonReport,
                  textColor: Colors.white,
                  borderColor: this.isAllValid
                      ? AppColors.PRIMARY
                      : AppColors.LIGHT_BLUE),
            ),
          ],
        ),
      ),
    );
  }
}
