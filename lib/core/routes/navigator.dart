// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigatorService {
  NavigatorService(
    this.context,
  );

  final BuildContext context;

  // pushReplacementNamed(String routeName) {
  //   Navigator.of(context).pushReplacementNamed(routeName);
  // }

  pushReplacementNamed(String routeName) {
    context.go(routeName);
  }

  void pop() {
    context.pop();
  }

  void popUntil(bool Function(Route<dynamic>) predicate) {
    Navigator.of(context).popUntil(predicate);
  }

  void pushNamed(String routeName) {
    context.go(routeName);
  }

  void push(MaterialPageRoute materialPageRoute) {
    Navigator.of(context).push(materialPageRoute);
  }

  void pushGo(String location, dynamic object) {
    context.push(location, extra: object);
  }
}
