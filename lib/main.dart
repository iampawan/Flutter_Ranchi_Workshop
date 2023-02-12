import 'package:flutter/material.dart';

import 'ranchi.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.purple,
      primarySwatch: Colors.purple,
      useMaterial3: true,
    ),
    home: const RanchiWidget(),
  ));
}
