import 'package:flutter/material.dart';
import 'package:sonda_flutter/Models/InputAutomate.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final userInputController = new TextEditingController();
  final inputController = new TextEditingController();
  final outputController = new TextEditingController();
  String _inputError;

  void _moveRovers() {
    if (_inputError == null && userInputController.text != "") {
      InputAutomate output = new InputAutomate(userInputController.text);
      setState(() {
        inputController.text = userInputController.text;
        outputController.text = output.output;
      });
    }
  }

  void _refresh() {
    userInputController.clear();
    inputController.clear();
    outputController.clear();
  }

  @override
  void initState() {
    super.initState();
    _inputError = null;
    userInputController.addListener(_inputChangeValidate);
  }

  @override
  void dispose() {
    userInputController.dispose();
    super.dispose();
  }

  void _inputChangeValidate() {
    setState(() {
      if (!_validateInput(userInputController.text) &&
          userInputController.text != "") {
        _inputError = "Invalid Input";
      } else {
        _inputError = null;
      }
    });
  }

  bool _validateInput(String input) {
    return InputAutomate.validateInput(input);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title), actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
            onPressed: _refresh,
          ),
        ]),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SafeArea(
              child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        CustomTextBox(
                          "User Input",
                          userInputController,
                          200,
                          EdgeInsets.fromLTRB(0, 0, 0, 15),
                          errorText: _inputError,
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: ElevatedButton(
                        onPressed: _moveRovers,
                        style: ButtonStyle(),
                        child: Text("Move Rovers"),
                      ),
                    ),
                    Row(
                      children: [
                        CustomTextBox(
                          "Input",
                          inputController,
                          200,
                          EdgeInsets.fromLTRB(0, 0, 5, 15),
                          readOnly: true,
                        ),
                        Icon(Icons.arrow_right_alt),
                        CustomTextBox(
                          "Output",
                          outputController,
                          200,
                          EdgeInsets.fromLTRB(5, 0, 0, 15),
                          readOnly: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
        ));
  }
}

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
