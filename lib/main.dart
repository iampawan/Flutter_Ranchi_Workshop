import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ranchi.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.purple,
      primarySwatch: Colors.purple,
      useMaterial3: true,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
    home: const RanchiWidget(),
  ));
}
