import 'package:flutter/material.dart';

enum PaymentButtonType { regular, selected }

class PaymentButton extends StatefulWidget {
  final String text;
  final PaymentButtonType type;
  final VoidCallback onPressed;

  const PaymentButton({
    Key? key,
    required this.text,
    required this.type,
    required this.onPressed,
  }) : super(key: key);

  @override
  _PaymentButtonState createState() => _PaymentButtonState();
}

class _PaymentButtonState extends State<PaymentButton> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.black : Color(0xFFF2F2F2);
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final isSelected = widget.type == PaymentButtonType.selected;
    final isFocused = _focusNode.hasFocus;

    return Focus(
      focusNode: _focusNode,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          height: 56,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: isSelected || isFocused ? Colors.yellow : Colors.transparent,
            border: Border.all(
              color: isSelected || isFocused ? Colors.transparent : Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                color: isSelected || isFocused ? Colors.black : Colors.grey[800],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
