import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constant/colors.dart';
import '../../core/constant/images.dart';

class SplashScreenPage extends StatelessWidget {
  final _key = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double size(int percent) => context.width*(percent/100);

    return Scaffold(
      key: _key,
      backgroundColor: primary,
      body: Stack(
        children: [
          Center(
            child: FLEmptyContainer(
              image: Image.asset(logoTransparent, width: size(100)),
              title: "Please Wait ....",
              titleStyle: GoogleFonts.lato(color: Colors.white),
            ),
          ),
          GFFloatingWidget(
            child: GFIconBadge(
                      child: GFAvatar(
                      size: GFSize.LARGE,
                      backgroundImage:AssetImage(logo),
                      ),
                  counterChild:  GFBadge(
                  text: '12',
                  shape: GFBadgeShape.circle,
                  )
                ),
            body:Text('body or any kind of widget here..'),
            verticalPosition: MediaQuery.of(context).size.height* 0.2,
            horizontalPosition: MediaQuery.of(context).size.width* 0.8,
          )
        ],
      ),
    );
  }
}