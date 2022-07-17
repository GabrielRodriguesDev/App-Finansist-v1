import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  const InputForm(
      {Key? key,
      this.initialValue,
      required this.labelText,
      this.suffixIcon,
      this.keyboardType = TextInputType.text,
      this.validator,
      required this.onSaved})
      : super(key: key);

  final String? initialValue;
  final String labelText;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onSaved: onSaved,
      decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(borderSide: BorderSide()),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary, width: 2),
          ),
          suffixIcon: Icon(suffixIcon)),
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}
