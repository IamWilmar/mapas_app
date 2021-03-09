import 'package:flutter/cupertino.dart';

part 'navegar_fadein.dart';

Route navegarMapaFafeIn(BuildContext context, Widget page) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: Duration(milliseconds: 20000),
      transitionsBuilder: (context, animation, _, child) {
        return FadeTransition(
          child: child,
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeOut),
          ),
        );
      });
}
