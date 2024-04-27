import 'package:flutter/material.dart';

extension NumX on num {
  SizedBox get sbh => SizedBox(height: toDouble());
  SizedBox get sbw => SizedBox(width: toDouble());
  Radius get r => Radius.circular(toDouble());
  BorderRadius get br => BorderRadius.circular(toDouble());
}
