import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constant/app_colors.dart';

class ProfileTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String labelText;
  final bool enabled;
  final IconData? prefixIcon;
  final bool isPassword;
  final Function(String text)? onChanged;
  final String? suffixIcon;
  final int? line;
  const ProfileTextField({
    required this.textEditingController,
    required this.enabled,
    required this.labelText,
    this.prefixIcon,
    required this.isPassword,
    this.onChanged,
    this.suffixIcon,
    this.line,
  });

  @override
  State<ProfileTextField> createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {
  @override
  Widget build(BuildContext context) {
    bool _obscureText = true;
    void _toggle() {
      setState(() {
        _obscureText = !_obscureText;
      });
    }

    return TextFormField(
      maxLines: widget.line,
      controller: widget.textEditingController,
      enabled: widget.enabled,
      // cursorColor: AppColors.,
      decoration: InputDecoration(
          alignLabelWithHint: true,
          prefixIcon: Icon(widget.prefixIcon, color: AppColors.blue),
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: _toggle,
                  child: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ))
              : widget.suffixIcon != null
                  ? IconButton(
                      onPressed: () {},
                      icon: Container(
                        width: 10.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                          widget.suffixIcon!,
                        ))),
                      ))
                  : null,
          border: OutlineInputBorder(
            gapPadding: 0,
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelText: widget.labelText,
          labelStyle: TextStyle(
              // color: AppColors.gry,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp)),
      onSaved: (String? value) {
        // This optional block of code can be used to run
        // code when the user saves the form.
      },
      validator: (String? value) {
        if (value != null) {
          return "لا يجب ان يكون الحقل  فارغ";
        } else {
          return null;
        }
      },
    );
  }
}
