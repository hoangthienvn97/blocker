import 'package:flutter/material.dart';
import 'package:phone_blocker/core/models/model_common.dart';
import 'package:phone_blocker/widgets/my_list/collection_item.dart';

class CollectionsView extends StatefulWidget {
  CollectionsResponse collectedCollections;
  Function onItemCountChanged;

  Function(int) onCollectionUnBlocked;

  CollectionsView(this.collectedCollections,
      {this.onItemCountChanged, this.onCollectionUnBlocked});

  @override
  _CollectionsViewState createState() => _CollectionsViewState();
}

class _CollectionsViewState extends State<CollectionsView> {
  _onCollectionUnblocked(Collection collection) {
    var index = widget.collectedCollections.data.items
        .indexWhere((item) => item.id == collection.id);

    if (widget.onCollectionUnBlocked != null) {
      widget.onCollectionUnBlocked.call(index);
    }

    setState(() {
      widget.collectedCollections.data.items.removeAt(index);
      if (widget.onItemCountChanged != null) {
        widget.onItemCountChanged.call();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.collectedCollections == null
          ? 0
          : widget.collectedCollections.data.items.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          color: Colors.white,
          child: CollectionItem(
            key: ValueKey(widget.collectedCollections.data.items[index].id),
            collection: widget.collectedCollections.data.items[index],
            onCollectionUnblocked: _onCollectionUnblocked,
          ),
        ),
      ),
    );
  }
}
