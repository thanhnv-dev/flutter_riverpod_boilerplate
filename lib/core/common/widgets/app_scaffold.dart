import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final bool activeUnFocusKeyboard;
  final bool scroll;
  final bool fullScreen;
  final bool paddingTop;
  final bool paddingBottom;
  final ScrollPhysics? physicsScroll;
  final EdgeInsetsGeometry? margin;

  const AppScaffold({
    super.key,
    required this.child,
    this.appBar,
    this.drawer,
    this.activeUnFocusKeyboard = false,
    this.scroll = false,
    this.fullScreen = true,
    this.paddingTop = false,
    this.paddingBottom = false,
    this.physicsScroll,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: GestureDetector(
        onTap: (activeUnFocusKeyboard)
            ? () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              }
            : null,
        child: scroll
            ? SingleChildScrollView(
                physics: physicsScroll,
                child: _appContainer(context),
              )
            : _appContainer(context),
      ),
    );
  }

  Container _appContainer(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      width: (fullScreen) ? mediaQuery.size.width : null,
      height: (fullScreen) ? mediaQuery.size.height : null,
      padding: EdgeInsets.only(
        top: (paddingTop) ? mediaQuery.padding.top : 0,
        bottom: (paddingBottom) ? mediaQuery.padding.bottom : 0,
      ),
      margin: margin,
      child: child,
    );
  }
}
