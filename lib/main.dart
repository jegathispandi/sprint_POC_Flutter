import 'package:flutter/material.dart';
import 'package:cool_ui/cool_ui.dart';
import 'package:sprint_POC/Page1.dart';
import 'package:sprint_POC/Unkown.dart';
import 'package:sprint_POC/page2.dart';
import 'package:sprint_POC/page3.dart';
import 'package:sprint_POC/page4.dart';
import 'package:sprint_POC/page5.dart';
import 'package:sprint_POC/page6.dart';
import 'keyboards/test_keyboard.dart';

import 'init_db.dart';
import 'conf.dart';

void main()  {
      NumberKeyboard.register();
  TestKeyboard.register();
  runApp(KeyboardRootWidget(child: MyApp()));
    initDb(db: db);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        MyHomePage.routeName: (context) => MyHomePage(),
        // Page1.routeName: (context) => Page1()
      },
      initialRoute: MyHomePage.routeName,
      onGenerateRoute: (RouteSettings settings) {
        var page;
        String routeName = settings.name;
        switch (routeName) {
          case Page1.routeName:
            page = Page1(
              data: settings.arguments,
            );
            return MaterialPageRoute(builder: (context) => page);
            break;

          case Page2.routeName:
            page = Page2(
              data: settings.arguments,
            );
            return MaterialPageRoute(builder: (context) => page);
            break;
          case Page3.routeName:
            page = Page3(
              data: settings.arguments,
            );
            return MaterialPageRoute(builder: (context) => page);
            break;
          case Page4.routeName:
            page = Page4(
              data: settings.arguments,
            );
            return MaterialPageRoute(builder: (context) => page);
            break;
          case Page5.routeName:
            page = Page5(
              data: settings.arguments,
            );
            return MaterialPageRoute(builder: (context) => page);
            break;
          case Page6.routeName:
            page = Page6(
              data: settings.arguments,
            );
            return MaterialPageRoute(builder: (context) => page);
            break;
        }
      },
      onUnknownRoute: (RouteSettings settings) {
        var page;
        page = Unknown(data: settings.arguments);

        return MaterialPageRoute(builder: (context) => page);
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const String routeName = "/";
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? "Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("Scan Bar Code"),
              onPressed: () {
                Navigator.pushNamed(context, Page1.routeName,
                    arguments: "This is some data");
              },
            ),
            FlatButton(
              child: Text("QR Scanner"),
              onPressed: () {
                Navigator.pushNamed(context, Page2.routeName,
                    arguments: "This is some data");
              },
            ),
            FlatButton(
              child: Text("Geolocator"),
              onPressed: () {
                Navigator.pushNamed(context, Page3.routeName,
                    arguments: "This is some data");
              },
            ),
            FlatButton(
              child: Text("Database sample"),
              onPressed: () {
                Navigator.pushNamed(context, Page4.routeName,
                    arguments: "This is some data");
              },
            ),
            FlatButton(
              child: Text("Custom keyboard"),
              onPressed: () {
                Navigator.pushNamed(context, Page5.routeName,
                    arguments: "This is some data");
              },
            ),
            FlatButton(
              child: Text("Signature Capturing"),
              onPressed: () {
                Navigator.pushNamed(context, Page6.routeName,
                    arguments: "This is some data");
              },
            ),
          ],
        ),
      ),
    );
  }
}
