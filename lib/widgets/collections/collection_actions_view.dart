import 'package:flutter/material.dart';
import 'package:phone_blocker/core/common/assets.dart';
import 'package:phone_blocker/core/models/model_common.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/localizations.dart';
import 'package:phone_blocker/widgets/post_button.dart';

class CollectionActionsView extends StatelessWidget {
  final hasViewDetailsButton;
  Collection collection;
  Function(Collection) onLikeClick;
  Function(Collection) onUnBlock;
  Function onviewDetail;

  CollectionActionsView(this.hasViewDetailsButton,
      {this.collection, this.onLikeClick, this.onUnBlock, this.onviewDetail});

  @override
  Widget build(BuildContext context) {
    return hasViewDetailsButton
        ? buildWithViewDetails(context)
        : buildWithoutViewDetails();
  }

  Widget buildWithViewDetails(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: PostButton(
            background: AppColors.TOAST,
            image: Image.asset(
              Assets.ICON_LIST_VIEW,
              width: 20,
              height: 20,
            ),
            label: Localized.get.mylistViewDetail,
            textColor: AppColors.BLACK_TEXT,
            onTap: () => {
              if (onviewDetail != null)
                {
                  onviewDetail.call(),
                }
            },
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
            image: Image.asset(
              this.collection.favorited
                  ? Assets.ICON_LIKE_FULL
                  : Assets.ICON_LIKE,
              width: 20,
              height: 20,
            ),
            label:
                "${this.collection.favoritedCount} ${Localized.get.communityLikes}",
            textColor: this.collection.favorited
                ? AppColors.PRIMARY
                : AppColors.BLACK_TEXT,
            onTap: () => {
              if (onLikeClick != null)
                {
                  onLikeClick.call(collection),
                }
            },
          ),
        ),
        const Divider(),
        Expanded(
          flex: 1,
          child: PostButton(
            background: Colors.white,
            image: Image.asset(
              Assets.ICON_TRASH,
              width: 20,
              height: 20,
            ),
            label: Localized.get.mylistUnblock,
            textColor: AppColors.BLACK_TEXT,
            onTap: () => {
              if (onUnBlock != null)
                {
                  onUnBlock.call(collection),
                }
            },
          ),
        ),
      ],
    );
  }
}
