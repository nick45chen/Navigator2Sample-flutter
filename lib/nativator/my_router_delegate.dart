import 'package:flutter/material.dart';
import 'package:flutter_nativator2_sample/model/detail_data_model.dart';
import 'package:flutter_nativator2_sample/pages/detail_page.dart';
import 'package:flutter_nativator2_sample/pages/home_page.dart';

part 'my_route_path.dart';

class MyRouterDelegate extends RouterDelegate<MyRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyRoutePath> {
  // 為 navigator 設置一個 key，方便透過 navigatorKey.currentState() 獲取 NavigatorState
  final GlobalKey<NavigatorState> _navigatorKey;

  //
  List<MaterialPage> pages = [];
  DetailDataModel? _detailDataModel;
  MyRoutePath? _routePath;

  MyRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(MyRoutePath path) async {
    _routePath = path;
  }

  @override
  Widget build(BuildContext context) {
    pages = [
      _pageWrap(
        HomePage(
          onJumpToDetail: (model) {
            _detailDataModel = model;
            notifyListeners();
          },
        ),
      ),
      if (_detailDataModel != null) _pageWrap(DetailPage(model: _detailDataModel)),
    ];

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
