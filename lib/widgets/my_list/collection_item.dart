import 'package:flutter/material.dart';
import 'package:phone_blocker/core/api/api.dart';
import 'package:phone_blocker/core/models/model_common.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/localizations.dart';
import 'package:phone_blocker/resources/text_styles.dart';
import 'package:phone_blocker/widgets/button.dart/button.dart';
import 'package:phone_blocker/widgets/collections/collection_actions_view.dart';
import 'package:phone_blocker/widgets/collections/collection_info_view.dart';

class CollectionItem extends StatefulWidget {
  Collection collection;

  Function(Collection) onCollectionUnblocked;

  CollectionItem({Key key, this.collection, this.onCollectionUnblocked});

  @override
  _CollectionItemState createState() => _CollectionItemState();
}

class _CollectionItemState extends State<CollectionItem> {
  void _like(Collection collection) {
    if (!collection.favorited) {
      Api().postFavorite(
        collection.id,
        onSuccess: (response) => {
          this.setState(() {
            widget.collection = response.data;
          })
        },
        onError: (_) => {},
      );
    } else {
      Api().deleteFavorite(
        collection.id,
        onSuccess: (response) => {
          this.setState(() {
            widget.collection = response.data;
          })
        },
        onError: (_) => {},
      );
    }
  }

  void _unblock(Collection collection) {
    dialog(
      context,
      onOk: () => {
        Api().deleteCollected(collection.id,
            onSuccess: (response) => {
                  this.setState(() {
                    widget.collection = response.data;
                    if (widget.onCollectionUnblocked != null) {
                      widget.onCollectionUnblocked.call(widget.collection);
                    }
                  })
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
    return Column(
      children: [
        CollectionInfoView(widget.collection),
        Divider(),
        CollectionActionsView(
          false,
          collection: widget.collection,
          onLikeClick: _like,
          onUnBlock: _unblock,
        ),
      ],
    );
  }
}
