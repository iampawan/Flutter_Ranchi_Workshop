import 'dart:math';

import 'package:flutter/material.dart';

class RanchiWidget extends StatefulWidget {
  const RanchiWidget({super.key});

  @override
  State<RanchiWidget> createState() => _RanchiWidgetState();
}

class _RanchiWidgetState extends State<RanchiWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation =
        Tween<double>(begin: 0.4, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.4, 0.7, curve: Curves.easeIn),
    ));

    _rotateAnimation =
        Tween<double>(begin: 0.4, end: pi * 2).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.7, 1.0, curve: Curves.easeOut),
    ));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 1.0),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MText(
                            letter: "R",
                            scaleValue: _scaleAnimation.value,
                            rotateValue: _rotateAnimation.value,
                          ),
                          MText(
                            letter: "A",
                            scaleValue: _scaleAnimation.value,
                            rotateValue: _rotateAnimation.value,
                          ),
                          MText(
                            letter: "N",
                            scaleValue: _scaleAnimation.value,
                            rotateValue: _rotateAnimation.value,
                          ),
                          MText(
                            letter: "C",
                            scaleValue: _scaleAnimation.value,
                            rotateValue: _rotateAnimation.value,
                          ),
                          MText(
                            letter: "H",
                            scaleValue: _scaleAnimation.value,
                            rotateValue: _rotateAnimation.value,
                          ),
                          MText(
                            letter: "I",
                            scaleValue: _scaleAnimation.value,
                            rotateValue: _rotateAnimation.value,
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 1.0),
                        ),
                      ),
                    ]);
              }),
        ),
      ),
    );
  }
}

class MText extends StatelessWidget {
  const MText(
      {super.key,
      required this.letter,
      required this.scaleValue,
      required this.rotateValue});
  final String letter;
  final double scaleValue;
  final double rotateValue;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scaleValue,
      child: Transform.rotate(
        angle: rotateValue,
        child: Text(
          letter,
          style: TextStyle(
            fontSize: 40 * scaleValue * 2,
            fontWeight: FontWeight.bold,
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          ),
        ),
      ),
    );
  }
}
