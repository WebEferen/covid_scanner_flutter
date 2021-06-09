import 'package:flutter/cupertino.dart';
import './navigation.dart';

class PageScaffold extends StatelessWidget {
  final bool navigationBarEnabled;
  final Color backgroundColor;
  final String title;
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;

  const PageScaffold({
    Key? key,
    required this.title,
    required this.child,
    this.navigationBarEnabled = true,
    this.backgroundColor = CupertinoColors.white,
    this.padding = const EdgeInsets.all(10),
    this.margin = const EdgeInsets.all(0)
  }) : super(key: key);

  @override
  CupertinoPageScaffold build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: this.backgroundColor,
      resizeToAvoidBottomInset: true,
      navigationBar: (this.navigationBarEnabled) ? new NavigationBar(title: this.title) : null,
      child: SafeArea(
        minimum: EdgeInsets.zero,
        child: Container(
          padding: this.padding,
          child: this.child,
          margin: this.margin,
        ),
      ),
    );
  }
}
