import 'package:flutter/material.dart';

Padding inputF(Function(String?) validate, {required TextEditingController controller,
required String hint, required String helper, required IconData iconData, bool password = false}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, top: 10),
    child: SizedBox(
      width: 350,
      child : TextFormField(
        validator: (value) => validate(value),
        autofocus: true,
        controller: controller,
        obscureText: password,
        decoration: InputDecoration(
          hintText: hint,
          border: const OutlineInputBorder(),
          helperText: helper,
          prefixIcon: Icon(iconData)
        ),
      )
    ),
    );
}