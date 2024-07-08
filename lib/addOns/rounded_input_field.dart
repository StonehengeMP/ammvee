import 'package:flutter/material.dart';
import 'package:ammvee_release/addOns/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.white),
            border: InputBorder.none,
            icon: Icon(icon, color: Colors.white)),
      ),
    );
  }
}

