import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/utils/ui_manager.dart';

class ApplicationUIManager extends UIManager{
  ApplicationUIManager(BuildContext context) : super(context);

  @override
  Size referenceModel() {
    return Size(360, 640);
  }
}

