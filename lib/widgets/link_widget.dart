import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextLinkButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color defaultColor;
  final Color pressedColor;

  const CustomTextLinkButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.defaultColor = Colors.grey,
    this.pressedColor = Colors.black,
  }) : super(key: key);

  @override
  _CustomTextLinkButtonState createState() => _CustomTextLinkButtonState();
}

class _CustomTextLinkButtonState extends State<CustomTextLinkButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onPressed();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: Container(
        height: 63,
        child: Text(
          widget.text,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: _isPressed ? widget.pressedColor : widget.defaultColor,
          ),
        ),
      ),
    );
  }
}