import 'package:flutter/material.dart';
import 'package:phone_blocker/core/common/country_list.dart';

class NumberPhone extends StatefulWidget {
  @override
  _NumberPhoneState createState() => _NumberPhoneState();
}

class _NumberPhoneState extends State<NumberPhone> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: Countries.countryList.length,
        itemBuilder: (context, index) => Row(children: [
          Image.asset("./assets/flags/${Countries.countryList[index]["alpha_2_code"].toLowerCase()}.png"),
          Text(Countries.countryList[index]["en_short_name"])
        ],)
      ),
    );
  }
}