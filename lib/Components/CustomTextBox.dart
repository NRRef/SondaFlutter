import 'package:flutter/material.dart';

class CustomTextBox extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final double height;
  final EdgeInsets padding;
  final String errorText;
  final bool readOnly;

  CustomTextBox(this.labelText, this.controller, this.height, this.padding,
      {this.errorText, this.readOnly});
  @override
  _CustomTextBoxState createState() => _CustomTextBoxState();
}

class _CustomTextBoxState extends State<CustomTextBox> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: widget.height,
        padding: widget.padding,
        child: TextField(
          controller: widget.controller,
          textAlignVertical: TextAlignVertical.top,
          readOnly: widget.readOnly != null ? widget.readOnly : false,
          maxLines: null,
          minLines: null,
          expands: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              errorText: widget.errorText,
              focusColor: Colors.blue,
              labelText: widget.labelText,
              alignLabelWithHint: true),
        ),
      ),
    );
  }
}
