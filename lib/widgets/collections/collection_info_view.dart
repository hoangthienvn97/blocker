import 'package:flutter/material.dart';
import 'package:phone_blocker/core/common/assets.dart';
import 'package:phone_blocker/core/common/convert_time.dart';
import 'package:phone_blocker/core/models/collection.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/text_styles.dart';

class CollectionInfoView extends StatelessWidget {
  final Collection collection;

  CollectionInfoView(this.collection);

  @override
  Widget build(BuildContext context) {
    var lastUpdateTime = collection.updatedAt != null
        ? diffTimeToNow(this.collection.updatedAt)
        : "";
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            margin: new EdgeInsets.all(16),
            child: (collection.logo?.isNotEmpty ?? false) ? Image.network(collection.logo) : Image.asset(Assets.ICON_LOGO),
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      this.collection.name,
                      style: TextStyles.Subtitle1.apply(
                          color: AppColors.Secondary),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          lastUpdateTime,
                          style: TextStyles.Caption.apply(
                              color: AppColors.PLACE_HOLDER),
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  this.collection.description,
                  style: TextStyles.Body2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
