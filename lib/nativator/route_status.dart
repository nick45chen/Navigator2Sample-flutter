part of 'my_router_delegate.dart';

// 定義 route status
enum RouteStatus {
  login,
  registration,
  home,
  detail,
  unKnow,
}
// 取得 page 對應的 RouteStatus
RouteStatus getRouteStatus(MaterialPage page) {
  if (page.child is LoginPage) {
    return RouteStatus.login;
  } else if (page.child is RegistrationPage) {
    return RouteStatus.registration;
  } else if (page.child is HomePage) {
    return RouteStatus.home;
  } else {
    return RouteStatus.unKnow;
  }
}

// route 訊息
class RouteStatusInfo {
  final RouteStatus routeStatus;
  final Widget page;

  RouteStatusInfo(this.routeStatus, this.page);
}
