import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_blocker/core/api/api.dart';
import 'package:phone_blocker/core/common/commons.dart';
import 'package:phone_blocker/core/common/convert_time.dart';
import 'package:phone_blocker/core/models/phone_data_detail.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/localizations.dart';
import 'package:phone_blocker/resources/text_styles.dart';
import 'package:phone_blocker/widgets/button.dart/button.dart';
import 'package:phone_blocker/widgets/post_button.dart';

class MyCollectionWidget extends StatefulWidget {
  final PhoneDataDetail phoneDataDetail;

  Function(PhoneDataDetail) onUnblocked;
  MyCollectionWidget(this.phoneDataDetail, this.onUnblocked);

  @override
  _MyCollectionWidgetState createState() => _MyCollectionWidgetState();
}

class _MyCollectionWidgetState extends State<MyCollectionWidget> {
  static const platform =
      const MethodChannel('co.vacsolutions.callblocker/callBlocking');

  Future<void> _unblockNumbers(phoneNumber) async {
    try {
      final result = await platform.invokeMethod('unblockNumbers', {
        'numbers': [phoneNumber]
      });
      if (result == true) {
        print("unBlock " + phoneNumber.toString());
      } else {
        print(result);
      }
    } on PlatformException catch (e) {}
  }

  void _unblock(PhoneDataDetail dataDetail) {
    dialog(
      context,
      onOk: () => {
        Api().deleteSpamNumber(dataDetail.id,
            onSuccess: (response) => {
                  _unblockNumbers(
                      int.parse(dataDetail.phone.phone.replaceAll("+", ""))),
                  if (this.widget.onUnblocked != null)
                    {this.widget.onUnblocked.call(widget.phoneDataDetail)},
                },
            onError: (_) => {})
      },
    );
  }

  void dialog(BuildContext context, {Function onOk}) {
    showDialog(
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
                Localized.get.myCollectionDialogTitle,
                style: TextStyles.Subtitle1,
              ),
            ),
          ),
          actions: <Widget>[
            ButtonAction(
                onTap: () => Navigator.pop(context),
                label: Localized.get.myCollectionDialogCancel,
                background: Colors.white,
                borderColor: AppColors.PRIMARY,
                textColor: AppColors.PRIMARY),
            SizedBox(
              width: 10,
            ),
            ButtonAction(
                onTap: () {
                  if (onOk != null) {
                    onOk.call();
                  }
                  Navigator.pop(context);
                },
                label: Localized.get.mylistUnblock,
                background: AppColors.PRIMARY,
                borderColor: AppColors.PRIMARY,
                textColor: Colors.white),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              widget.phoneDataDetail.phone.phone,
                              style: TextStyles.Subtitle1,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Text(
                              diffTimeToNow(widget.phoneDataDetail.updatedAt),
                              style: TextStyles.Caption.apply(
                                  color: AppColors.PLACE_HOLDER),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            widget.phoneDataDetail.description,
                            style:
                                TextStyles.Body2.apply(color: AppColors.Grey),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Row(
                        children: [
                          Image.asset(Assets.ICON_COMMUNITY_PEOPLE),
                          Text(
                            " ${widget.phoneDataDetail.phone.numberOfReporters} ${Localized.get.myCollectionPeopleReport}",
                            style: TextStyles.Caption.apply(
                                color: AppColors.Orange),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  PostButton(
                    image: Image.asset(
                      Assets.ICON_TRASH,
                      width: 20,
                      height: 20,
                    ),
                    label: Localized.get.mylistUnblock,
                    onTap: () => _unblock(widget.phoneDataDetail),
                    background: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
