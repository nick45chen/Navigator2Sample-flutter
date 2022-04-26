import 'package:flutter/material.dart';

part 'my_route_path.dart';

class MyRouterDelegate extends RouterDelegate<MyRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyRoutePath> {
  // 為 navigator 設置一個 key，方便透過 navigatorKey.currentState() 獲取 NavigatorState
  final GlobalKey<NavigatorState> _navigatorKey;
  final List<MaterialPage> pages = [];

  MyRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  Future<Function> setNewRoutePath(MyRoutePath configuration) {
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: pages,
      onPopPage: (route, result) {
        // 判斷是否可以返回
        if (!route.didPop(result)) {
          return false;
        } else {
          return true;
        }
      },
    );
  }

  // 創建頁面
  MaterialPage _pageWrap(Widget child) => MaterialPage(key: ValueKey(child.hashCode), child: child);
}
