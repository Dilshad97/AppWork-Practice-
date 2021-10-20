import 'package:flutter/material.dart';

class Info extends InheritedWidget {

  const Info({
    // required Key key,
    required this.score,
    required Widget child,
  }) : assert(score != null),
        assert(child != null),
        super( child: child);

  final int score;

  static Info? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Info>();
  }

  @override
  bool updateShouldNotify(covariant Info oldWidget) {
    return oldWidget.score != score;
  }
}
