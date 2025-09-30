import 'package:advanced_animation_chain/build_dot.dart';
import 'package:flutter/material.dart';

class LoadingDotsAnimation extends StatefulWidget {
  const LoadingDotsAnimation({Key? key}) : super(key: key);

  @override
  State<LoadingDotsAnimation> createState() => _LoadingDotsAnimationState();
}

class _LoadingDotsAnimationState extends State<LoadingDotsAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _dot1Scale;
  late Animation<double> _dot2Scale;
  late Animation<double> _dot3Scale;

  late Animation<double> _dot1Opacity;
  late Animation<double> _dot2Opacity;
  late Animation<double> _dot3Opacity;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    const curve = Curves.easeOutBack;

    _dot1Scale = Tween(begin: 0.5, end: 1.3).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: curve),
      ),
    );

    _dot2Scale = Tween(begin: 0.5, end: 1.3).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.6, curve: curve),
      ),
    );

    _dot3Scale = Tween(begin: 0.5, end: 1.3).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 0.9, curve: curve),
      ),
    );

    _dot1Opacity = Tween(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeIn),
      ),
    );

    _dot2Opacity = Tween(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.6, curve: Curves.easeIn),
      ),
    );

    _dot3Opacity = Tween(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 0.9, curve: Curves.easeIn),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (_, __) => buildDot(_dot1Scale, _dot1Opacity),
        ),
        const SizedBox(width: 8),
        AnimatedBuilder(
          animation: _controller,
          builder: (_, __) => buildDot(_dot2Scale, _dot2Opacity),
        ),
        const SizedBox(width: 8),
        AnimatedBuilder(
          animation: _controller,
          builder: (_, __) => buildDot(_dot3Scale, _dot3Opacity),
        ),
      ],
    );
  }
}
