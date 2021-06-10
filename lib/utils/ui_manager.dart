import 'dart:math';
import 'dart:ui';

import 'package:flutter/widgets.dart';

abstract class UIManager {
  Size _currentModel;
  double _widthScale = 1;
  double _heightScale = 1;
  Orientation _orientation;

  UIManager(BuildContext _context) {
    _currentModel = MediaQuery.of(_context).size;
    _orientation = MediaQuery.of(_context).orientation;
  }

  double height(BuildContext context, double refVal) {
    return refVal * heightScale;
  }

  double width(BuildContext context, double refVal) {
    return refVal * widthScale;
  }

  double size(BuildContext context, double size) {
    return size * widthScale;
  }

  double get heightScale => _currentModel.height / referenceModel().height;

  double get widthScale => _currentModel.width / referenceModel().width;

  double get scale => min(widthScale, heightScale);

  Size referenceModel();
}