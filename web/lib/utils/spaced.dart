import 'package:flutter/material.dart';

extension Spaced on Iterable<Widget> {
  List<Widget> spacedWith(Widget spacer) => expand((item) sync* {
        yield spacer;
        yield item;
      }).skip(1).toList();

  List<Widget> spaced(double gap) =>
      spacedWith(SizedBox(width: gap, height: gap));
}
