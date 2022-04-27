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
    return FutureBuilder<void>(
      future: Future.delayed(const Duration(seconds: 3)), // 模擬一些需要初始化的行為
      builder: (context, snapshot) {
        // 定義 route
        var widget = snapshot.connectionState == ConnectionState.done
            ? Router(
                routerDelegate: _routerDelegate,
              )
            : const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
        return MaterialApp(
          home: widget,
        );
      },
    );
  }
}
