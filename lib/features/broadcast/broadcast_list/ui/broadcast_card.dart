import 'package:bar_client/core/src/constants/string_constants.dart';
import 'package:bar_client/core_ui/src/widgets/height_spacer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BroadcastCard extends StatelessWidget {
  final String name;
  final DateTime dateTime;
  final String description;

  const BroadcastCard({
    required this.name,
    required this.dateTime,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String dateString = DateFormat.MMMMEEEEd(dateTime).toString();
    return Card(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(name),
              const HeightSpacer(),
              Text(dateString),
            ],
          ),
          Image.network(description ?? StringConstants.placeholderUrl),
        ],
      ),
    );
  }
}
