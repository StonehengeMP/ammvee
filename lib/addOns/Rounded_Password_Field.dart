import 'package:flutter/material.dart';
import 'package:ammvee_release/addOns/text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const RoundedPasswordField({
    super.key,
    required this.onChanged,
  });

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {

  bool passwordBool = true;
  var visibilityButton = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: passwordBool,
        style: const TextStyle(color: Colors.white),
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: "Contraseña",
          hintStyle: const TextStyle(color: Colors.white),
          icon: const Icon(
            Icons.lock,
            color: Colors.white,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              passwordBool
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
            color: Colors.white,
            onPressed: () {
              setState(() {
                passwordBool = !passwordBool;
              });
            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
