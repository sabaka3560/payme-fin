import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedShapes extends StatefulWidget {
  final bool alignShapes; // New parameter to control shape alignment

  const AnimatedShapes({super.key, required this.alignShapes});

  @override
  _AnimatedShapesState createState() => _AnimatedShapesState();
}

class _AnimatedShapesState extends State<AnimatedShapes> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late ScrollController _topScrollController;
  late ScrollController _bottomScrollController;

  final List<String> _svgAssets = [
    'assets/asset.svg',
    'assets/asset(1).svg',
    'assets/asset(2).svg',
    'assets/asset(3).svg',
    'assets/asset(4).svg',
    'assets/asset(5).svg',
  ];

  final List<Offset> _predefinedPositions = [
    Offset(50, 100),
    Offset(150, 200),
    Offset(250, 300),
    Offset(350, 100),
    Offset(100, 400),
    Offset(200, 500),
    Offset(300, 400),
    Offset(50, 500),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..forward();
    _topScrollController = ScrollController();
    _bottomScrollController = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _topScrollController.dispose();
    _bottomScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final random = Random();

    if (widget.alignShapes) {
      // Aligned layout above and below "hello"
      return SafeArea( // Wrap aligned shapes with SafeArea
        child: Stack(
          children: [
            Positioned(
              top: 275, // Adjusted for SafeArea
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                controller: _topScrollController,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_svgAssets.length * 2, (index) {
                    final asset = _svgAssets[index % _svgAssets.length];
                    final size = 30.0 + random.nextDouble() * 70.0; // Sizes between 30 and 100

                    return SvgPicture.asset(
                      asset,
                      width: size,
                      height: size,
                    );
                  }),
                ),
              ),
            ),
            Positioned(
              bottom: 275, // Adjusted for SafeArea
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                controller: _bottomScrollController,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_svgAssets.length * 2, (index) {
                    final asset = _svgAssets[index % _svgAssets.length];
                    final size = 30.0 + random.nextDouble() * 70.0; // Sizes between 30 and 100

                    return SvgPicture.asset(
                      asset,
                      width: size,
                      height: size,
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      // Original random layout
      return SafeArea( // Wrap random shapes with SafeArea
        child: Stack(
          children: List.generate(_predefinedPositions.length, (index) {
            final asset = _svgAssets[random.nextInt(_svgAssets.length)];
            final position = _predefinedPositions[index];
            final size = 30.0 + random.nextDouble() * 70.0; // Sizes between 30 and 100

            return Positioned(
              left: position.dx,
              top: position.dy,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: 1.0 + 0.2 * _controller.value,
                    child: child,
                  );
                },
                child: SvgPicture.asset(
                  asset,
                  width: size,
                  height: size,
                ),
              ),
            );
          }),
        ),
      );
    }
  }

  @override
  void didUpdateWidget(AnimatedShapes oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.alignShapes) {
      Future.delayed(Duration.zero, () {
        _animateScroll();
      });
    }
  }

  void _animateScroll() {
    _topScrollController.animateTo(
      _topScrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 10),
      curve: Curves.linear,
    ).then((_) {
      _topScrollController.animateTo(
        0,
        duration: const Duration(seconds: 10),
        curve: Curves.linear,
      ).then((_) {
                _animateScroll();
      });
    });

    _bottomScrollController.animateTo(
      0,
      duration: const Duration(seconds: 10),
      curve: Curves.linear,
    ).then((_) {
      _bottomScrollController.animateTo(
        _bottomScrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 10),
        curve: Curves.linear,
      ).then((_) {
        _animateScroll();
      });
    });
  }
}