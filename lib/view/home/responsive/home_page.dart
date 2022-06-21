import 'package:flutter/material.dart';
import 'package:webapp/view/home/desktop_home.dart';
import 'package:webapp/view/home/mobile_home.dart';
import 'package:webapp/view/home/responsive/responsive_layout.dart';
import 'package:webapp/view/home/tablet_home.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        mobile: MobileHome(),
        tablet: TabletHome(),
        desktop: DesktopHome(),
      ),
    );
  }
}
