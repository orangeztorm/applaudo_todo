import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformAlertDialog extends StatelessWidget {
  const PlatformAlertDialog({
    required this.title,
    required this.message,
    required this.onPositivePressed,
    required this.positiveText,
    this.onNegativePressed,
    this.negativeText = 'Cancel',
    super.key,
  });
  final String title;
  final String message;
  final VoidCallback onPositivePressed;
  final VoidCallback? onNegativePressed;
  final String positiveText;
  final String negativeText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Platform.isAndroid
        ? AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              Visibility(
                visible: onNegativePressed != null,
                child: TextButton(
                  onPressed:
                      onNegativePressed ?? () => Navigator.of(context).pop(),
                  child: Text(
                    negativeText,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
              ),
              TextButton(
                onPressed: onPositivePressed,
                child: Text(
                  positiveText,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
            ],
          )
        : CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              Visibility(
                visible: onNegativePressed != null,
                child: CupertinoDialogAction(
                  onPressed:
                      onNegativePressed ?? () => Navigator.of(context).pop(),
                  child: Text(
                    negativeText,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
              ),
              CupertinoDialogAction(
                onPressed: onPositivePressed,
                child: Text(
                  positiveText,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
            ],
          );
  }
}
