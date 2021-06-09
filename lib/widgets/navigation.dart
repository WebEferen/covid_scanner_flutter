import 'package:covid_scanner/screens/init.page.dart';
import 'package:flutter/cupertino.dart';

class NavigationBar extends StatelessWidget implements ObstructingPreferredSizeWidget {
  final String title;

  NavigationBar({ required this.title });

  @override
  CupertinoNavigationBar build(BuildContext context) {
    return CupertinoNavigationBar(
      leading: this.backButton(context),
      middle: new Text(this.title, style: TextStyle(color: CupertinoColors.black)),
    );
  }

  backButton(BuildContext context) {
    if (!Navigator.of(context).canPop()) return null;

    return new GestureDetector(
      child: new Icon(CupertinoIcons.back, color: CupertinoColors.black),
      onTap: () => NavigationBar.goBack(context),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }

  static goBack(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      return Navigator.of(context).pop();
    }

    return Navigator.of(context).pushNamed(InitPage.pageName);
  }
}