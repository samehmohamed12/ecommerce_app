import 'package:flutter/material.dart';

class MainDialog {
  final BuildContext context;
  final String title;
  final String content;
  final List<Map<String, void Function()?>>? actions;

  MainDialog(
      {required this.context,
      required this.title,
      required this.content,
      this.actions});

  showAlertDialog() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
            title: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
            content: Text(
              content,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            actions: (actions != null)
                ? actions!
                    .map((actions) => TextButton(
                        onPressed: actions.values.first,
                        child: Text(actions.keys.first)))
                    .toList()
                : [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('ok')),
                  ]));
  }
}
