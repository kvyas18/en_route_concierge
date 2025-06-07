import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final double verticalPadding;
  final String value;
  final Widget? suffixIcon;
  final bool showLabel;
  final TextEditingController controller;
  final bool obscureText;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.verticalPadding,
    required this.value,
    required this.suffixIcon,
    this.showLabel = true,
    this.obscureText = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          showLabel
              ? Text(
            hintText.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14.0,
              color: Color(0xFF9CA4AA),
            ),
          )
              : SizedBox(),
          SizedBox(height: 7.0),
          TextFormField(
            controller: controller,
            // Removed initialValue since controller is used
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              contentPadding: EdgeInsets.symmetric(
                vertical: verticalPadding,
                horizontal: 15.0,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[400]!,
                ),
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
                color: Colors.grey[400],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
