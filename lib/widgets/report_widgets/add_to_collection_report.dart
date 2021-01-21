import 'package:flutter/material.dart';
import 'package:phone_blocker/core/api/api.dart';
import 'package:phone_blocker/core/common/assets.dart';
import 'package:phone_blocker/core/models/collection.dart';
import 'package:phone_blocker/core/models/responses/collections_response.dart';
import 'package:phone_blocker/resources/localizations.dart';

class AddToCollectionReport extends StatefulWidget {
  Function(bool, int) onOptionChanged;

  AddToCollectionReport({this.onOptionChanged});
  @override
  _AddToCollectionReportState createState() =>
      _AddToCollectionReportState(onOptionChanged: onOptionChanged);
}

class _AddToCollectionReportState extends State<AddToCollectionReport> {
  CollectionsResponse collectionsResponse;

  Function(bool, int) onOptionChanged;

  _AddToCollectionReportState({this.onOptionChanged});

  @override
  void initState() {
    super.initState();
    _getCollections();
  }

  _getCollections() {
    Api().getCollections(
        onSuccess: (collectionsData) => {
              this.setState(() {
                this.collectionsResponse = collectionsData;
              })
            },
        onError: (_) => {});
  }

  Collection _option;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            Localized.get.reportAddToCollection,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          children: collectionsResponse == null
              ? []
              : collectionsResponse.data.items
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Card(
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          title: Text(e.name),
                          leading: Radio(
                            value: e,
                            groupValue: _option,
                            onChanged: (Collection value) {
                              setState(() {
                                _option = value;
                                onOptionChanged.call(
                                    _option != null, _option.id);
                              });
                            },
                          ),
                          trailing: (e.logo?.isNotEmpty ?? false) ? Image.network(e.logo) : Image.asset(Assets.ICON_LOGO),
                        ),
                      ),
                    ),
                  )
                  .toList(),
        ),
      ],
    );
  }
}
