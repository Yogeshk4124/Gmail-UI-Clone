import 'dart:math' as math;

import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:animated_icon_button/src/unions.dart';
import 'package:flutter/material.dart';

class AnimatedIconButton extends StatefulWidget {
  AnimatedIconButton({
    Key? key,
    this.size = 30,
    this.initialIcon = 0,
    required this.icons,
    this.onPressed,
    this.animationController,
    this.animationDirection = const AnimationDirection.bounce(),
    this.duration = const Duration(milliseconds: 200),
    this.padding = const EdgeInsets.all(8.0),
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.disabledColor,
    this.focusNode,
    this.autofocus = false,
    this.enableFeedback = true,
    this.constraints,
    this.visualDensity,
    this.alignment = Alignment.center,
    this.splashRadius,
  }) : super(key: key);

  final double size;

  final int initialIcon;

  final List<AnimatedIconItem> icons;

  final Duration? duration;

  final AnimationController? animationController;

  final AnimationDirection animationDirection;

  final Function? onPressed;

  final Color? focusColor;

  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final Color? disabledColor;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool enableFeedback;
  final BoxConstraints? constraints;
  final VisualDensity? visualDensity;
  final EdgeInsets padding;
  final Alignment alignment;
  final double? splashRadius;

  @override
  _AnimatedIconButtonState createState() => _AnimatedIconButtonState(
        initialIcon: initialIcon,
        icons: icons,
        animationDirection: animationDirection,
      );
}

class _AnimatedIconButtonState extends State<AnimatedIconButton>
    with SingleTickerProviderStateMixin {
  _AnimatedIconButtonState({
    required int initialIcon,
    required List<AnimatedIconItem> icons,
    required AnimationDirection animationDirection,
  })  : assert(initialIcon < icons.length,
            'initialIcon must be lower than the icons.length'),
        nowIndex = initialIcon,
        nowDirection = animationDirection,
        nowIcon = icons[initialIcon];

  late final AnimationController animationController;

  int nowIndex;
  AnimationDirection nowDirection;
  AnimatedIconItem nowIcon;
  late final Animation<double> _arrowAnimation;
  late final Duration halfDuration;

  @override
  void initState() {
    animationController = widget.animationController ??
        AnimationController(vsync: this, duration: widget.duration);
    _addStatusListener();

    _arrowAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );

    halfDuration = Duration(
        milliseconds: animationController.duration!.inMilliseconds ~/ 2);

    super.initState();
  }

  void _addStatusListener() {
    animationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.forward ||
          status == AnimationStatus.reverse) {
        _changeIcon(status);
      }
      // }
    });
  }

  Future<void> _changeIcon(AnimationStatus status) async {
    await Future<void>.delayed(halfDuration);
    if (status == AnimationStatus.reverse) {
      nowIndex = _previousIndex();
    } else {
      nowIndex = _nextIndex();
    }
    setState(() {
      nowIcon = widget.icons[nowIndex];
    });
  }

  Future<void> runAnimation(AnimationDirection direction) async {
    direction.map(forward: (_) {
      animationController.value = animationController.lowerBound;
      animationController.forward();
    }, reverse: (_) {
      animationController.value = animationController.upperBound;
      animationController.reverse();
    }, bounce: (_) {
      if (nowIndex == 0) {
        nowDirection = const AnimationDirection.forward();
      } else if (nowIndex == widget.icons.length - 1) {
        nowDirection = const AnimationDirection.reverse();
      }
      runAnimation(nowDirection);
    });
  }

  int _nextIndex() {
    return nowIndex + 1 < widget.icons.length ? nowIndex + 1 : 0;
  }

  int _previousIndex() {
    return nowIndex - 1 < 0 ? widget.icons.length - 1 : nowIndex - 1;
  }

  @override
  Widget build(BuildContext context) {
    return buildIconButton();
  }

  IconButton buildIconButton() {
    return IconButton(
      onPressed: () {
        nowIcon.onPressed?.call();
        widget.onPressed?.call();
        runAnimation(widget.animationDirection);
      },
      icon: AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget? child) {
            return Transform.rotate(
              angle: _arrowAnimation.value * 2.0 * math.pi,
              child: child,
            );
          },
          child: nowIcon.icon),
      focusColor: widget.focusColor,
      hoverColor: widget.hoverColor,
      highlightColor: widget.highlightColor,
      splashColor: widget.splashColor,
      disabledColor: widget.disabledColor,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      enableFeedback: widget.enableFeedback,
      tooltip: nowIcon.tooltip,
      constraints: widget.constraints,
      visualDensity: widget.visualDensity,
      alignment: widget.alignment,
      splashRadius: widget.splashRadius,
    );
  }
}
