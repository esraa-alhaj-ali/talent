import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../constant/app_colors.dart';
import '../../../../constant/app_style.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final IconData prefixIcon;
 final  bool isVisible;
  final TextInputType? textInputType;
  final TextEditingController controller;
  final String? validatorMessage;
  final bool isValidator;
  final bool isPassword;
  final Function(String text)? onChanged;
  final String? suffixIcon;
  final bool readonly;
  // final int?line;

  CustomTextField(
      {required this.label,
      required this.hintText,
      required this.controller,
      required this.prefixIcon,
      this.textInputType,
      this.isVisible = false,
        this.validatorMessage,
        required this.isValidator,
        this.isPassword=false,
        this.onChanged,
        this.suffixIcon,
        this.readonly=false,
        // this.line,
      });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // maxLines:widget.line,
      readOnly: widget.readonly,
      validator:(input) {
      if (input!.isEmpty) {
        if (widget.isValidator) {
          return widget.validatorMessage ?? "";
        }}
      return null;},
      keyboardType: widget.textInputType,
      textInputAction: TextInputAction.done,
      obscureText:widget.isPassword?_obscureText:false,
      onChanged:widget.onChanged,
      controller: widget.controller,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        prefixIcon: Icon(widget.prefixIcon, color: AppColors.blue),
        suffixIcon:widget.isPassword
            ? GestureDetector(
            onTap: _toggle,
            child: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color:Colors.grey,
            ))
            : widget.suffixIcon != null
            ? IconButton(
            onPressed: () {},
            icon: Container(
              width: 10.w,
              height: 5.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.suffixIcon!,))),
            ))
            : null,
        label: Text(
          widget.label,
          style: AppTextStyle.labelTextField,
        ),
        border: OutlineInputBorder(
          gapPadding: 0,
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey),
        ),
        hintText: widget.hintText,
        hintStyle: AppTextStyle.hintTextStyle,
      ),
    );
  }
}
