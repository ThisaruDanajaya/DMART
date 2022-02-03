import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class customBtn extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  final bool? outlineBtn;
  final bool? isLoading;

  customBtn({
    this.text = 'defaultValue',
    this.outlineBtn,
    this.onPressed,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    bool _outlineBtn = outlineBtn ?? false;
    bool _isLoading = isLoading ?? false;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: _outlineBtn ? Colors.transparent : Colors.white,
          border: Border.all(
            color: Colors.white,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(
            12.0,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 90.0,
          vertical: 24.0,
        ),

        child: Stack(children: [
          Visibility(
            visible: _isLoading ? false : true,
            child: Center(
              child: Text(
                text ?? "text",
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: _outlineBtn ? Colors.white : Colors.deepPurple,
                ),
              ),
            ),
          ),
          Visibility(
            visible: _isLoading,
            child:const Center(
              child: SizedBox(
                height: 30.0,
                width: 30.0,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
