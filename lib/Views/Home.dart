import 'package:flutter/material.dart';
import 'package:sonda_flutter/Models/InputAutomate.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController inputController = new TextEditingController();
  final TextEditingController outputController = new TextEditingController();

  void _moveRovers() {}

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
            onPressed: () {},
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
                    Container(
                      height: 200,
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: TextField(
                        controller: inputController,
                        textAlignVertical: TextAlignVertical.top,
                        maxLines: null,
                        minLines: null,
                        expands: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusColor: Colors.blue,
                            labelText: 'Input',
                            alignLabelWithHint: true),
                      ),
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
                    Container(
                      height: 200,
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: TextField(
                        textAlignVertical: TextAlignVertical.top,
                        readOnly: true,
                        maxLines: null,
                        minLines: null,
                        expands: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusColor: Colors.blue,
                            labelText: 'Output',
                            alignLabelWithHint: true),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ));
  }
}
