import 'dart:math';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  double buttonRadius = 100;

  final Tween<double> backgroundScale = Tween<double>(begin: 0.0, end: 1.0);

  AnimationController? starIconController;

  @override
  void initState() {
    super.initState();
    starIconController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    starIconController!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _pageBackground(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _circularAnimationButton(),
                _starIcon(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _pageBackground() {
    return TweenAnimationBuilder(
      tween: backgroundScale,
      duration: const Duration(seconds: 1),
      builder: (BuildContext context, double scale, Widget? child) {
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
      child: Container(
        color: Colors.blue,
      ),
    );
  }

  Widget _circularAnimationButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            buttonRadius += buttonRadius == 200 ? -100 : 100;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(
            seconds: 2,
          ),
          curve: Curves.easeInOut,
          height: buttonRadius,
          width: buttonRadius,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Center(
            child: Text(
              "Basic",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _starIcon() {
    return AnimatedBuilder(
      animation: starIconController!.view,
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: starIconController!.value * 2 * pi,
          child: child,
        );
      },
      child: const Icon(
        Icons.star,
        size: 100,
        color: Colors.white,
      ),
    );
  }
}
