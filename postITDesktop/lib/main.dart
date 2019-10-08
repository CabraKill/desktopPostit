import 'package:overIt/pages/WallScreen.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';

void main() {
  // See https://github.com/flutter/flutter/wiki/Desktop-shells#target-platform-override
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  runApp(MaterialApp(
    title: "Wall Plane",
    initialRoute: '/',
    //theme: ThemeData.dark(),
    routes: {
      '/' : (context) => WallScreen()
    },
  ));
}