import 'package:flutter/material.dart';
import 'package:phone_blocker/core/models/collection.dart';
import 'package:phone_blocker/resources/app_colors.dart';
import 'package:phone_blocker/widgets/collections/collection_actions_view.dart';
import 'package:phone_blocker/widgets/collections/collection_info_view.dart';

class MyCollectionView extends StatefulWidget {
  @override
  _MyCollectionViewState createState() => _MyCollectionViewState();
}

class _MyCollectionViewState extends State<MyCollectionView> {
  @override
  Widget build(BuildContext context) {
    var collection = Collection(
        name: 'My Collection',
        description: 'This is a list of your reported spam phone numbers',
        updatedAt: DateTime.now());
    return Container(
      color: AppColors.TOAST,
      child: Column(
        children: [
          CollectionInfoView(collection),
          Divider(
            color: Colors.white,
          ),
          CollectionActionsView(true)
        ],
      ),
    );
  }
}
