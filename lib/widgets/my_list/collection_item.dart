import 'package:flutter/material.dart';
import 'package:phone_blocker/core/api/api.dart';
import 'package:phone_blocker/core/models/model_common.dart';
import 'package:phone_blocker/resources/text_styles.dart';
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
