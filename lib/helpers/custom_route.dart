import 'package:flutter/material.dart';

//* CustomRoute > Custom Fade-in Transition
class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({
    WidgetBuilder builder,
    RouteSettings settings,
  }) : super(
          builder: builder,
          settings: settings,
        );

  // buildTransitions
  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (settings.name == "/") {
      return child;
    }
    return FadeTransition(
      opacity: animation,
      child: child,
    );

    // return super.buildTransitions(context, animation, secondaryAnimation, child);
  }
}

//* CustomPageTransitionBuilder
class CustomPageTransitionBuilder extends PageTransitionsBuilder {
  // buildTransitions
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (route.settings.name == "/") {
      return child;
    }
    return FadeTransition(
      opacity: animation,
      child: child,
    );

    // return super.buildTransitions(context, animation, secondaryAnimation, child);
  }
}
