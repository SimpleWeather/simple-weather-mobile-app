import 'package:flutter/material.dart';

void showCustomSnackBarWidget({
  String? prefix,
  Color? backgroundColor,
  Color? iconColor,
  IconData icon = Icons.check_circle,
  required BuildContext context,
  required String message,
}) {
  ScaffoldMessenger.of(context)
      .showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.fixed,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Icon(
                  icon,
                  color: iconColor,
                ),
              ),
              Flexible(
                child: Text(
                  '${prefix ?? ''}$message',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: iconColor,
                  ),
                  onPressed: () =>
                      ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                ),
              ),
            ],
          ),
          backgroundColor: backgroundColor,
        ),
      )
      .closed
      .then(
    (_) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).clearSnackBars();
    },
  );
}
