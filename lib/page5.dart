import 'package:sprint_POC/keyboards/test_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cool_ui/cool_ui.dart';
import 'package:flutter/services.dart';

class Page5 extends StatefulWidget {
   static const String routeName = "/page5";
  final data;
  Page5({this.data});
  @override
  State<StatefulWidget> createState() {
    return CustomKeyboardDemoState();
  }
}

class CustomKeyboardDemoState extends State<Page5> {
  TextEditingController textEditingController =
      TextEditingController(text: 'test');
  TextEditingController textEditing2Controller =
      TextEditingController(text: 'test');

  @override
  Widget build(BuildContext context) {
    return KeyboardMediaQuery(child: Builder(builder: (ctx) {
      // CoolKeyboard.init(ctx);
      return Scaffold(
          appBar: AppBar(
            title: Text("Custom Keyboard Demo"),
          ),
          body: ListView(
            children: <Widget>[
              
              TextField(
                controller: textEditing2Controller,
                decoration: InputDecoration(labelText: 'username'),
                keyboardType: NumberKeyboard.inputType,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'password'),
                keyboardType: TestKeyboard.inputType,
              )
            ],
          ));
    }));
  }

  static Future<String> showInputDialogs(
      {@required BuildContext context,
      Widget titleWidget,
      Widget messageWidget,
      List<TextInputFormatter> inputFormatters,
      TextInputType keyboardType = TextInputType.number}) {
    String value;
    return showCupertinoDialog<String>(
        context: context,
        builder: (context) {
//       The minimum insets for contents of the Scaffold to keep visible.
          List<Widget> children = [];
          if (messageWidget != null) {
            children.add(messageWidget);
          }
          children.add(Form(
              child: Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Material(
                      child: TextField(
                    inputFormatters: inputFormatters,
                    keyboardType: keyboardType,
                    autofocus: true,
                    onChanged: (newValue) {
                      value = newValue;
                    },
                  )))));
          return AnimatedPadding(
              padding: MediaQuery.of(context).viewInsets +
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
              duration: const Duration(milliseconds: 300),
              // curve: Curves.linear,
              child: CupertinoAlertDialog(
                title: titleWidget,
                content: Column(
                  children: children,
                ),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text("取消"),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  CupertinoDialogAction(
                    child: Text("確認"),
                    onPressed: () {
                      Navigator.of(context).pop(value ?? '');
                    },
                  )
                ],
              ));
        });
  }
}
