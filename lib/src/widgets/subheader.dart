import 'package:flutter/material.dart';

class SubHeader extends StatelessWidget {
  const SubHeader({
    Key? key,
    required String? text,
  })  : _text = text,
        super(key: key);

  final String? _text;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Text(_text!),
      )
    ]);
  }
}
