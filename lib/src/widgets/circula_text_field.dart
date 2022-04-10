import 'package:flutter/material.dart';
import 'package:wareef/src/core/utils/constants.dart';

class CircularTextField extends StatelessWidget {
  const CircularTextField({
    Key? key,
    required TextEditingController controller,
    required this.validation,
    this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.minLines,
    this.keyboardType,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final String? Function(String?)? validation;
  final String? label;
  final String? hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _controller,
          keyboardType: keyboardType,
          onSaved: (newValue) => _controller.text = newValue!,
          validator: validation!,
          cursorColor: Colors.black,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
          decoration: circularInputDecorationTheme().copyWith(
            labelText: label,
            hintText: hint,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
          maxLines: maxLines,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
