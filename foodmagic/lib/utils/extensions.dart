import 'package:flutter/material.dart';

extension ThemeUtils on BuildContext {
  /// App theme
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get accentColor => Theme.of(this).accentColor;
  AppBarTheme get appBarTheme => Theme.of(this).appBarTheme;
  Color get buttonColor => Theme.of(this).buttonColor;
  IconThemeData get iconTheme => Theme.of(this).iconTheme;

  /// Text Theme
  TextStyle? get headline1 => Theme.of(this).textTheme.headline1;
  TextStyle? get headline2 => Theme.of(this).textTheme.headline2;
  TextStyle? get headline3 => Theme.of(this).textTheme.headline3;
  TextStyle? get headline4 => Theme.of(this).textTheme.headline4;
  TextStyle? get bodyText1 => Theme.of(this).textTheme.bodyText1;
  TextStyle? get bodyText2 => Theme.of(this).textTheme.bodyText2;
  TextStyle? get subtitle1 => Theme.of(this).textTheme.subtitle1;
  TextStyle? get subtitle2 => Theme.of(this).textTheme.subtitle2;
  TextStyle? get caption => Theme.of(this).textTheme.caption;
  TextStyle? get button => Theme.of(this).textTheme.button;
}

/// Asset Extenions for calling images
extension AssetUtils on String {
  String get png => 'assets/$this.png';
  String get svg => 'assets/$this.svg';
  String get jpeg => 'assets/$this.jpeg';
}

/// Padding extension
extension CustomExtension on Widget {
  Widget padAll(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);

  Widget padSym(double v, double h) => Padding(
      padding: EdgeInsets.symmetric(vertical: v, horizontal: h), child: this);

  Widget padT(double top) =>
      Padding(padding: EdgeInsets.only(top: top), child: this);

  Widget padL(double left) =>
      Padding(padding: EdgeInsets.only(left: left), child: this);

  Widget padR(double right) =>
      Padding(padding: EdgeInsets.only(right: right), child: this);

  Widget padB(double bottom) =>
      Padding(padding: EdgeInsets.only(bottom: bottom), child: this);

  Widget padOnly(double t, double l, double b, double r) =>
      Padding(padding: EdgeInsets.fromLTRB(l, t, r, b), child: this);
}
