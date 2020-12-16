import 'package:flutter/material.dart';
import 'package:phone_blocker/core/models/collection.dart';
import 'package:phone_blocker/widgets/collections/collection_actions_view.dart';
import 'package:phone_blocker/widgets/collections/collection_info_view.dart';

class CollectionsView extends StatefulWidget {
  @override
  _CollectionsViewState createState() => _CollectionsViewState();
}

class _CollectionsViewState extends State<CollectionsView> {
  List<Collection> collections = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: collections.length,
        itemBuilder: (context, index) => Column(
          children: [
            CollectionInfoView(this.collections[index]),
            CollectionActionsView(false),
          ],
        ),
      ),
    );
  }
}
