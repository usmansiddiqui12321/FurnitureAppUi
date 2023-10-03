import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final IconData? prefixIcon; // Add prefix icon here
  final IconData? postfixIcon; // Add postfix icon here
  final void Function()? prefixOnTap;
  final void Function()? postfixOnTap;

  @override
  final Size preferredSize;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.textColor,
    required this.iconColor,
    this.prefixIcon, // Initialize prefix icon
    this.postfixIcon,
    this.prefixOnTap,
    this.postfixOnTap, // Initialize postfix icon
  }) : preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: iconColor),
      leading: prefixIcon != null
          ? IconButton(
              icon: Icon(prefixIcon),
              onPressed: prefixOnTap,
              color: iconColor) // Display prefix icon if provided
          : null,
      title: Text(
        title,
        style: GoogleFonts.merriweather(
          color: const Color(0xFF303030),
          fontSize: 18,
          fontWeight: FontWeight.w700,
          height: 0,
        ),
      ),
      centerTitle: true,
      backgroundColor: backgroundColor,
      actions: <Widget>[
        if (postfixIcon != null)
          IconButton(
              icon: Icon(postfixIcon,
                  color: iconColor), // Display postfix icon if provided
              onPressed: postfixOnTap),
      ],
    );
  }
}
