import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final bool ispass;
  const CustomTextField({
    super.key,
    required this.title,
    required this.ispass,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: TextFormField(
        onTapOutside: (PointerDownEvent) {},

        // controller: _nameController,
        decoration: InputDecoration(
          fillColor: Colors.black,
          focusColor: Colors.black,
          iconColor: Colors.black,
          hoverColor: Colors.black,
          labelText: title, // Title (Label),
          contentPadding: const EdgeInsets.only(bottom: 40.0),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: ispass
                ? const Icon(
                    Icons.remove_red_eye,
                    color: Colors.black,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}