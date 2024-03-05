import 'package:flutter/material.dart';
import 'package:prometh_ai/utils/compose.dart';

import 'texts/normal_body.dart';
import 'texts/normal_title.dart';

confirmDialog(
  BuildContext context, {
  required VoidCallback onSure,
  VoidCallback? onCancel,
  String? description,
  String? title,
}) =>
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: NormalTitle(title ?? 'Are you sure?'),
              content: (description != null) ? NormalTitle(description) : null,
              actions: <Widget>[
                TextButton(
                  onPressed: compose(onSure, Navigator.of(context).pop),
                  child: const NormalBody("Yes"),
                ),
                TextButton(
                  onPressed: compose(onCancel, Navigator.of(context).pop),
                  child: const NormalBody("Cancel"),
                ),
              ],
            ));
