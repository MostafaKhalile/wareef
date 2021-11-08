import 'package:flutter/material.dart';

class Snackbar {
  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        action: SnackBarAction(
          label: '☓',
          textColor: Colors.white,
          onPressed: () {
            // Some code to undo the change.
          },
        ),
        content: Row(
          children: <Widget>[
            Wrap(
              children: <Widget>[
                ClipRRect(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(message,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.red));
  }
}
