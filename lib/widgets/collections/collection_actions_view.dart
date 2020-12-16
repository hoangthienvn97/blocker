import 'package:flutter/material.dart';
import 'package:phone_blocker/core/common/assets.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/widgets/post_button.dart';

class CollectionActionsView extends StatelessWidget {
  final hasViewDetailsButton;

  CollectionActionsView(this.hasViewDetailsButton);

  @override
  Widget build(BuildContext context) {
    return hasViewDetailsButton ? buildWithViewDetails() : buildWithoutViewDetails();
  }

  Widget buildWithViewDetails() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: PostButton(
            background: AppColors.TOAST,
            image: Image.asset(Assets.ICON_LIST_VIEW),
            label: "View Details",
            textColor: AppColors.BLACK_TEXT,
            onTap: null,
          ),
        ),
      ],
    );
  }

  Widget buildWithoutViewDetails() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: PostButton(
            background: Colors.white,
            image: Image.asset(Assets.ICON_LIKE),
            label: "10 likes",
            textColor: AppColors.BLACK_TEXT,
            onTap: () => null,
          ),
        ),
        const Divider(),
        Expanded(
          flex: 1,
          child: PostButton(
            background: Colors.white,
            image: Image.asset(Assets.ICON_SHIELD),
            label: 'Add to list',
            textColor: AppColors.BLACK_TEXT,
            onTap: () => null,
          ),
        ),
      ],
    );
  }
}