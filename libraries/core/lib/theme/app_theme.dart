import 'package:json_annotation/json_annotation.dart';

enum AppTheme {
  @JsonValue('light')
  light,
  @JsonValue('dark')
  dark
}
