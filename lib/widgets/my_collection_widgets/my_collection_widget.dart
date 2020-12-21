import 'package:flutter/material.dart';
import 'package:phone_blocker/core/api/api.dart';
import 'package:phone_blocker/core/common/commons.dart';
import 'package:phone_blocker/core/models/phone_data_detail.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/text_styles.dart';
import 'package:phone_blocker/widgets/post_button.dart';

class MyCollectionWidget extends StatefulWidget {
  final PhoneDataDetail phoneDataDetail;

  Function(PhoneDataDetail) onUnblocked;
  MyCollectionWidget(this.phoneDataDetail, this.onUnblocked);

  @override
  _MyCollectionWidgetState createState() => _MyCollectionWidgetState();
}

class _MyCollectionWidgetState extends State<MyCollectionWidget> {

  void _unblock(PhoneDataDetail dataDetail) {
    dialog(
      context,
      onOk: () => {
        Api().deleteSpamNumber(dataDetail.id,
            onSuccess: (response) => {
              if(this.widget.onUnblocked != null){
                this.widget.onUnblocked.call(widget.phoneDataDetail)
            }},
            onError: (_) => {})
      },
    );
  }

  void dialog(BuildContext context, {Function onOk}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Align(
              alignment: Alignment.center,
              child: Text(
                "Are you sure that  you want to unblock FE Credit Collection",
                style: TextStyles.Subtitle1,
              )),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "CANCEL",
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            FlatButton(
              onPressed: () {
                if (onOk != null) {
                  onOk.call();
                }
                Navigator.pop(context);
              },
              child: Text(
                "UNBLOCK",
                style: TextStyle(color: Colors.red, fontSize: 15),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
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
                              padding: const EdgeInsets.only(left : 16.0),
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
                              padding: const EdgeInsets.only(right : 16.0),
                              child: Text(
                                "Update ${DateTime.now().hour  - widget.phoneDataDetail.updatedAt.hour} hours ago",
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
                            padding: const EdgeInsets.only(left : 16.0),
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
                        padding: const EdgeInsets.only(left : 16.0),
                        child: Row(
                          children: [
                            Image.asset(Assets.ICON_COMMUNITY_PEOPLE),
                            Text(
                              " ${widget.phoneDataDetail.phone.numberOfReporters} people has reported",
                              style: TextStyles.Caption.apply(
                                  color: AppColors.Orange),
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    PostButton(
                      image: Image.asset(Assets.ICON_TRASH),
                      label: "Unblock",
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