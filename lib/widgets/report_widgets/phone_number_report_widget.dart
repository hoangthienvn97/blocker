import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:phone_blocker/core/api/api.dart';
import 'package:phone_blocker/core/common/assets.dart';
import 'package:phone_blocker/resources/text_styles.dart';

class PhoneNumberReport extends StatefulWidget {
  Function(bool, String) onPhoneChanged;
  PhoneNumberReport({this.onPhoneChanged});

  @override
  _PhoneNumberReportState createState() =>
      _PhoneNumberReportState(onPhoneChanged: onPhoneChanged);
}

class _PhoneNumberReportState extends State<PhoneNumberReport> {
  Function(bool, String) onPhoneChanged;

  _PhoneNumberReportState({this.onPhoneChanged});

  int reportsCount = 0;

  bool isHideNumberPeople = true;

  String phone = "";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String dialCode = "";

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'VN';
  PhoneNumber number = PhoneNumber(isoCode: 'VN');
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: new TextSpan(
              style: new TextStyle(
                fontSize: 14.0,
                fontFamily: "RobotoMono",
                fontStyle: FontStyle.normal,
                letterSpacing: 0.1,
                color: Colors.black,
              ),
              children: <TextSpan>[
                new TextSpan(
                  text: 'Phone Number ',
                  style: new TextStyle(fontWeight: FontWeight.w500),
                ),
                new TextSpan(text: '(required)'),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, top: 10),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber number) {
                          this.setState(() {
                            dialCode = number.dialCode;
                            isHideNumberPeople = true;
                            phone = number.phoneNumber;
                          });
                        },
                        onInputValidated: (bool value) async {
                          onPhoneChanged.call(value, phone);
                          if (value) {
                            Api().getPhoneNumber(phone,
                                onSuccess: (numberResponse) => {
                                      this.setState(() {
                                        reportsCount = numberResponse
                                                .data.reportedBy?.length ??
                                            0;
                                        isHideNumberPeople = false;
                                      }),
                                    },
                                onError: (errorResponse) => {
                                      this.setState(() {
                                        isHideNumberPeople = true;
                                      })
                                    });
                          }
                        },
                        selectorConfig: SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          backgroundColor: Colors.white,
                        ),
                        ignoreBlank: false,
                        maxLength: 15,
                        autoValidateMode: AutovalidateMode.disabled,
                        selectorTextStyle: TextStyle(color: Colors.black),
                        initialValue: number,
                        inputDecoration: InputDecoration(
                          // prefixText: "$dialCode ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        textFieldController: controller,
                      ),
                    ],
                  ),
                ),
              ),
              !isHideNumberPeople
                  ? Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              reportsCount > 5
                                  ? Image.asset(Assets.ICON_EXCLUDE)
                                  : null,
                              Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "FE Credit Collection - $reportsCount people has report",
                                    style: TextStyles.Caption.apply(
                                      color: Color(reportsCount > 5
                                          ? 0xffDF6900
                                          : 0xff0F58BA),
                                    ),
                                  )),
                            ].where((element) => element != null).toList(),
                          )),
                    )
                  : null
            ].where((element) => element != null).toList(),
          ),
        ),
      ],
    );
  }
}
