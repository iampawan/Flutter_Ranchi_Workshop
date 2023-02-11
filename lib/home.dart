import 'package:flutter/material.dart';

import 'home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Age Calculator"),
      ),
      body: const Center(child: HomeBody()),
    );
  }
}
