import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum FieldType { regular, active, disabled, small }

class CustomField extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final FieldType fieldType;
  final TextEditingController? controller;
  final double? width;

  const CustomField({
    Key? key,
    required this.labelText,
    this.hintText,
    this.fieldType = FieldType.regular,
    this.controller,
    this.width,
  }) : super(key: key);

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  final FocusNode _focusNode = FocusNode();
  bool _isActive = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isActive = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.black : Color(0xFFF2F2F2);
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 22),
          child: Text(
            widget.labelText,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ),
        SizedBox(height: 8),
        if (widget.fieldType == FieldType.disabled)
          _buildDisabledField()
        else
          _buildEditableField(),
      ],
    );
  }

  Widget _buildDisabledField() {
    return Container(
      width: widget.width ?? 318,
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFFEAEAEA),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          widget.controller?.text ?? '',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF626262),
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField() {
    final isSmall = widget.fieldType == FieldType.small;
    final isActive = widget.fieldType == FieldType.active || _isActive;

    return Container(
      margin: EdgeInsets.only(left: 25),
      width: widget.width ?? (isSmall ? 149 : 318),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: isActive ? Color(0xFFED6010) : Color(0xFFCACACA)),
      ),
      child: TextFormField(
        focusNode: _focusNode,
        controller: widget.controller,
        style: GoogleFonts.poppins(
          fontSize: isActive ? 18 : 16,
          color: isActive ? Color(0xFFED6010) : Colors.black87,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          hintText: widget.hintText,
          hintStyle: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.grey[400],
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}