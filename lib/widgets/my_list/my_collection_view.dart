import 'package:flutter/material.dart';
import 'package:phone_blocker/core/common/navigator_push.dart';
import 'package:phone_blocker/core/models/collection.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/screens/my_list/my_collection.dart';
import 'package:phone_blocker/widgets/collections/collection_actions_view.dart';
import 'package:phone_blocker/widgets/collections/collection_info_view.dart';

class MyCollectionView extends StatefulWidget {
  final DateTime lastUpdateTime;

  Function onViewDetailsClick;

  MyCollectionView({this.lastUpdateTime, this.onViewDetailsClick});

  @override
  _MyCollectionViewState createState() => _MyCollectionViewState();
}

class _MyCollectionViewState extends State<MyCollectionView> {
  @override
  Widget build(BuildContext context) {
    var collection = Collection(
        name: 'My Collection',
        description: 'This is a list of your reported spam phone numbers',
        updatedAt: widget.lastUpdateTime);
    return Container(
      color: AppColors.TOAST,
      child: Column(
        children: [
          CollectionInfoView(collection),
          Divider(
            color: Colors.white,
          ),
          CollectionActionsView(
            true,
            onviewDetail: widget.onViewDetailsClick,
          )
        ],
      ),
    );
  }
}
