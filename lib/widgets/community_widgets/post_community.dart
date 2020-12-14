import 'package:flutter/material.dart';
import 'package:phone_blocker/core/models/collection.dart';
import '../../core/common/commons.dart';

class PostCommunity extends StatefulWidget {
  final Collection collection;
  PostCommunity(this.collection);

  Function onBlockClick;

  Function onLikeClick;

  @override
  _PostCommunityState createState() => _PostCommunityState();
}

class _PostCommunityState extends State<PostCommunity> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.only(bottom: 10.0),
      color: Colors.white,
      child: Column(
        children: [
          _PostHeader(widget.collection),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: _getPostStats(
                widget.collection,
                () => {widget.onBlockClick.call()},
                () => {widget.onLikeClick.call()}),
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

class _PostHeader extends StatelessWidget {
  final Collection collection;

  _PostHeader(this.collection);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            margin: new EdgeInsets.all(16),
            child: Icon(
              Icons.account_circle_outlined,
              size: 40,
            ),
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
                    child: TextStyleText(collection.name, 16, FontWeight.w500,
                        0.15, Colors.black),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextStyleText(
                      "Update ${this.collection.updatedAt.hour - this.collection.createdAt.hour } hours ago",
                      12,
                      FontWeight.normal,
                      0.4,
                      Color(0xffBDBDBD),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: TextStyleText(collection.description, 14, FontWeight.normal,
                    0.25, Color(0xff484848)),
              ),
            ],
          ),
        ),
      ],
    );
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
        _PostButton(
          image: Image.asset(
            this.collection.favorited ? Assets.ICON_LIKE_FULL : Assets.ICON_LIKE,
          ),
          label: "${this.collection.favoritedCount} likes",
          textColor:
              this.collection.favorited ? ConfigColor.TEXT : Color(0xff333333),
          onTap: () => {onLikeClick.call()},
        ),
        const Divider(),
        _PostButton(
          image: Image.asset(
              this.collection.collected ? Assets.ICON_TICK : Assets.ICON_SHIELD),
          label: collection.collected ? 'Added' : 'Add to list',
          textColor:
              this.collection.collected ? ConfigColor.TEXT : Color(0xff333333),
          onTap: () => {onBlockClick.call()},
        ),
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Image image;
  final String label;
  final Function onTap;

  final Color textColor;

  const _PostButton(
      {Key key,
      @required this.image,
      @required this.label,
      @required this.onTap,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                image,
                const SizedBox(width: 4.0),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    label,
                    style: TextStyle(
                        fontFamily: 'RobotoMono',
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: textColor,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 0.25),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
