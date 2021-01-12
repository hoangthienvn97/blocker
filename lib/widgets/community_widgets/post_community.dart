import 'package:flutter/material.dart';
import 'package:phone_blocker/core/api/api.dart';
import 'package:phone_blocker/core/models/collection.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/resources/localizations.dart';
import 'package:phone_blocker/widgets/post_button.dart';
import '../../core/common/commons.dart';
import '../post_header.dart';

class PostCommunity extends StatefulWidget {
  Collection collection;
  PostCommunity(this.collection);

  @override
  _PostCommunityState createState() => _PostCommunityState();
}

class _PostCommunityState extends State<PostCommunity> {
  void _like() {
    if (!widget.collection.favorited) {
      Api().postFavorite(
        widget.collection.id,
        onSuccess: (response) => {
          this.setState(() {
            widget.collection = response.data;
          })
        },
        onError: (_) => {},
      );
    } else {
      Api().deleteFavorite(
        widget.collection.id,
        onSuccess: (response) => {
          this.setState(() {
            widget.collection = response.data;
          })
        },
        onError: (_) => {},
      );
    }
  }

  void _add() {
    if (!widget.collection.collected) {
      Api().postCollected(widget.collection.id,
          onSuccess: (response) => {
                this.setState(() {
                  widget.collection = response.data;
                })
              },
          onError: (errorResponse) => {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.only(bottom: 10.0),
      color: Colors.white,
      child: Column(
        children: [
          _PostHeaderCommunity(widget.collection),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child:
                _getPostStats(widget.collection, () => _add(), () => _like()),
          ),
        ],
      ),
    );
  }
}

Widget _getPostStats(
    Collection collection, Function onBlockClick, Function onLikeClick) {
  _PostStats widget = _PostStats(collection);
  widget.onBlockClick = () => {
        onBlockClick.call(),
      };
  widget.onLikeClick = () => {
        onLikeClick.call(),
      };
  return widget;
}

class _PostHeaderCommunity extends StatelessWidget {
  final Collection collection;

  _PostHeaderCommunity(this.collection);

  @override
  Widget build(BuildContext context) {
    return PostHeader(collection);
  }
}

class _PostStats extends StatelessWidget {
  Function onBlockClick;
  Function onLikeClick;
  final Collection collection;

  _PostStats(this.collection);

  @override
  Widget build(BuildContext context) {
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
            ),
            label:
                "${this.collection.favoritedCount} ${Localized.get.communityLikes}",
            textColor: this.collection.favorited
                ? AppColors.PRIMARY
                : AppColors.BLACK_TEXT,
            onTap: () => {onLikeClick.call()},
          ),
        ),
        const Divider(),
        Expanded(
          flex: 1,
          child: PostButton(
            background: Colors.white,
            image: Image.asset(this.collection.collected
                ? Assets.ICON_TICK
                : Assets.ICON_SHIELD),
            label: collection.collected
                ? Localized.get.communityAdded
                : Localized.get.communityAddToList,
            textColor: this.collection.collected
                ? AppColors.PRIMARY
                : AppColors.BLACK_TEXT,
            onTap: () => {onBlockClick.call()},
          ),
        ),
      ],
    );
  }
}
