import 'package:flutter/material.dart';
import 'package:ammvee_release/addOns/text_field_container.dart';

class RoundedInputField extends StatefulWidget {
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
  State<RoundedInputField> createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: widget.onChanged,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.white),
            border: InputBorder.none,
            icon: Icon(widget.icon, color: Colors.white)),
      ),
    );
  }
}

