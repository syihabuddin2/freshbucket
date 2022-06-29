import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshbucket/view/utils/constant.dart';

class TextFieldWidget extends StatelessWidget {
  double? txtHeight;
  double? txtWidth;
  TextEditingController? txtController;
  String? label;
  FontWeight? fontWeight;
  Widget? prefixIcon;

  TextFieldWidget({
    Key? key,
    this.txtHeight,
    this.txtWidth,
    this.txtController,
    this.label,
    this.fontWeight,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: txtHeight,
      width: txtWidth,
      child: Center(
        child: TextField(
          obscureText: false,
          controller: txtController,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            labelText: label != null ? '$label' : ' ',
            labelStyle: TextStyle(fontWeight: fontWeight),
            filled: false,
            fillColor: Colors.white,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ),
    );
  }
}
