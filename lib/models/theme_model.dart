import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class IconModel {
  final IconData icon;

  IconModel({this.icon});
}

IconModel model1 = IconModel(
  icon: Icons.wb_sunny_outlined,
);
IconModel model2 = IconModel(
  icon: FlutterIcons.moon_o_faw,
);

List<IconModel> allIcons = [model1, model2];
