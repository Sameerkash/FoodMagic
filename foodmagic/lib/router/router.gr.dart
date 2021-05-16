// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../views/app.view.dart' as _i3;
import '../views/home/Item.detail.view.dart' as _i4;
import '../views/order/order.view.dart' as _i5;

class Router extends _i1.RootStackRouter {
  Router([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    AppViewRoute.name: (routeData) => _i1.CupertinoPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.AppView();
        }),
    ItemDetailViewRoute.name: (routeData) => _i1.CupertinoPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.ItemDetailView();
        }),
    OrderViewRoute.name: (routeData) => _i1.CupertinoPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.OrderView();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(AppViewRoute.name, path: '/'),
        _i1.RouteConfig(ItemDetailViewRoute.name, path: '/item-detail-view'),
        _i1.RouteConfig(OrderViewRoute.name, path: '/order-view')
      ];
}

class AppViewRoute extends _i1.PageRouteInfo {
  const AppViewRoute() : super(name, path: '/');

  static const String name = 'AppViewRoute';
}

class ItemDetailViewRoute extends _i1.PageRouteInfo {
  const ItemDetailViewRoute() : super(name, path: '/item-detail-view');

  static const String name = 'ItemDetailViewRoute';
}

class OrderViewRoute extends _i1.PageRouteInfo {
  const OrderViewRoute() : super(name, path: '/order-view');

  static const String name = 'OrderViewRoute';
}
