import 'package:flutter/material.dart';
import 'package:flutter_nativator2_sample/nativator/my_router_delegate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _routerDelegate = MyRouterDelegate();

  @override
  Widget build(BuildContext context) {
    // 定義 route
    var widget = Router(
      routerDelegate: _routerDelegate,
    );
    return MaterialApp(
      home: widget,
    );
  }
}
