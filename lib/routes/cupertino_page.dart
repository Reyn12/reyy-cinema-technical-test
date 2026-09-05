import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Page<T> buildCupertinoPage<T>({
  required LocalKey key,
  required Widget child,
  Duration duration = const Duration(milliseconds: 400),
}) {
  return _CupertinoWithModalsPage<T>(
    key: key,
    child: child,
    transitionDuration: duration,
  );
}

class _CupertinoWithModalsPage<T> extends Page<T> {
  const _CupertinoWithModalsPage({
    required LocalKey super.key,
    required this.child,
    this.transitionDuration = const Duration(milliseconds: 400),
  });

  final Widget child;
  final Duration transitionDuration;

  @override
  Route<T> createRoute(BuildContext context) {
    return _CupertinoWithModalsPageRoute<T>(
      settings: this,
      child: child,
      transitionDuration: transitionDuration,
    );
  }
}

class _CupertinoWithModalsPageRoute<T> extends PageRoute<T> {
  _CupertinoWithModalsPageRoute({
    required this.child,
    required Duration transitionDuration,
    super.settings,
  }) : _transitionDuration = transitionDuration;

  final Widget child;
  final Duration _transitionDuration;

  ModalSheetRoute<dynamic>? _nextModalRoute;

  @override
  Duration get transitionDuration => _transitionDuration;

  @override
  Duration get reverseTransitionDuration => _transitionDuration;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  bool get opaque => true;

  @override
  bool canTransitionTo(TransitionRoute<dynamic> nextRoute) {
    return (nextRoute is PageRoute && !nextRoute.fullscreenDialog) ||
        nextRoute is ModalSheetRoute;
  }

  @override
  void didChangeNext(Route<dynamic>? nextRoute) {
    if (nextRoute is ModalSheetRoute) {
      _nextModalRoute = nextRoute;
    } else {
      _nextModalRoute = null;
    }
    super.didChangeNext(nextRoute);
  }

  @override
  bool didPop(T? result) {
    _nextModalRoute = null;
    return super.didPop(result);
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Semantics(scopesRoute: true, explicitChildNodes: true, child: child);
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final Animation<double> effectiveSecondary = _nextModalRoute != null
        ? const AlwaysStoppedAnimation<double>(0)
        : secondaryAnimation;

    return CupertinoPageTransition(
      primaryRouteAnimation: animation,
      secondaryRouteAnimation: effectiveSecondary,
      linearTransition: false,
      child: child,
    );
  }
}
