import 'package:flutter/material.dart';

ThemeData t(BuildContext context) => Theme.of(context);
ColorScheme ts(BuildContext context) => t(context).colorScheme;
TextTheme tt(BuildContext context) => t(context).textTheme;
