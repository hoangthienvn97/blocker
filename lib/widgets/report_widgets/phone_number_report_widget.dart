import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberReport extends StatefulWidget {
  Function(bool) onPhoneChanged;

  PhoneNumberReport({this.onPhoneChanged});

  @override
  _PhoneNumberReportState createState() => _PhoneNumberReportState(onPhoneChanged: onPhoneChanged);
}

class _PhoneNumberReportState extends State<PhoneNumberReport> {

  Function(bool) onPhoneChanged;

  _PhoneNumberReportState({this.onPhoneChanged});

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
          child: Form(
            key: formKey,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {
                      this.setState(() {
                        dialCode = number.dialCode;
                      });
                    },
                    onInputValidated: (bool value) {
                      onPhoneChanged.call(value);
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
                      prefixText: "$dialCode ",
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
        ),
      ],
    );
  }
}
