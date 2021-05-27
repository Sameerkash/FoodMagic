// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../models/fooditem/food.item.dart' as _i7;
import '../views/app.view.dart' as _i3;
import '../views/auth/signup.view.dart' as _i4;
import '../views/home/Item.detail.view.dart' as _i5;
import '../views/order/order.view.dart' as _i6;

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
    SignUpViewRoute.name: (routeData) => _i1.CupertinoPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.SignUpView();
        }),
    ItemDetailViewRoute.name: (routeData) => _i1.CupertinoPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ItemDetailViewRouteArgs>();
          return _i5.ItemDetailView(item: args.item);
        }),
    OrderViewRoute.name: (routeData) => _i1.CupertinoPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i6.OrderView();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(AppViewRoute.name, path: '/'),
        _i1.RouteConfig(SignUpViewRoute.name, path: '/sign-up-view'),
        _i1.RouteConfig(ItemDetailViewRoute.name, path: '/item-detail-view'),
        _i1.RouteConfig(OrderViewRoute.name, path: '/order-view')
      ];
}

class AppViewRoute extends _i1.PageRouteInfo {
  const AppViewRoute() : super(name, path: '/');

  static const String name = 'AppViewRoute';
}

class SignUpViewRoute extends _i1.PageRouteInfo {
  const SignUpViewRoute() : super(name, path: '/sign-up-view');

  static const String name = 'SignUpViewRoute';
}

class ItemDetailViewRoute extends _i1.PageRouteInfo<ItemDetailViewRouteArgs> {
  ItemDetailViewRoute({required _i7.FoodItem item})
      : super(name,
            path: '/item-detail-view',
            args: ItemDetailViewRouteArgs(item: item));

  static const String name = 'ItemDetailViewRoute';
}

class ItemDetailViewRouteArgs {
  const ItemDetailViewRouteArgs({required this.item});

  final _i7.FoodItem item;
}

class OrderViewRoute extends _i1.PageRouteInfo {
  const OrderViewRoute() : super(name, path: '/order-view');

  static const String name = 'OrderViewRoute';
}
