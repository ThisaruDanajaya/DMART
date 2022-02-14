import 'package:flutter/material.dart';

class Emailin extends StatelessWidget {
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;

  Emailin({
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const ShapeDecoration(
        color: Colors.white60,
        shape: StadiumBorder(),
      ),
      child: TextField(
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        textInputAction: textInputAction,
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Your Email",
            hintStyle: TextStyle(
              color: Colors.black45,
            ),
            contentPadding: EdgeInsets.only(left: 30)),
      ),
    );
  }
}

class Passwordin extends StatelessWidget {
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool? isPasswordField;

  Passwordin({
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction,
    this.isPasswordField,
  });

  @override
  Widget build(BuildContext context) {

    bool _isPasswordField = isPasswordField ?? false;

    return Container(
      width: double.infinity,
      height: 50,
      decoration: const ShapeDecoration(
        color: Colors.white60,
        shape: StadiumBorder(),
      ),
      child: TextField(
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        textInputAction: textInputAction,
        obscureText: _isPasswordField,
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Enter Your Password",
            hintStyle: TextStyle(
              color: Colors.black45,
            ),
            contentPadding: EdgeInsets.only(left: 30)),
      ),
    );
  }
}
