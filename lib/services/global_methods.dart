import 'package:flutter/material.dart';

class GlobalMethods {

  static Future<void> showErrorDialog({
    required String errorMessage,
    required BuildContext context,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(
                Icons.dangerous_outlined,
                color: Colors.red,
              ),
              SizedBox(width: 8),
              Text('An Error Occur'),
            ],
          ),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
