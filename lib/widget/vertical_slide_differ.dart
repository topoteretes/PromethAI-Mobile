import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prometh_ai/settings.dart';

const _segmentHeight = 20.0;

class VerticalSlideDiffer extends StatefulWidget {
  final String value;
  final bool isForward;
  final TextStyle theme;
  final Alignment? alignment;
  final double? width;

  const VerticalSlideDiffer({
    required this.value,
    required this.isForward,
    required this.theme,
    this.alignment = Alignment.centerLeft,
    this.width = 160,
    Key? key,
  }) : super(key: key);

  @override
  VerticalSlideDifferState createState() => VerticalSlideDifferState();
}

class VerticalSlideDifferState extends State<VerticalSlideDiffer> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late String oldValue;

  @override
  void initState() {
    super.initState();
    oldValue = widget.value;
    controller = AnimationController(duration: A.fast, vsync: this);
  }

  @override
  void didUpdateWidget(VerticalSlideDiffer oldWidget) {
    if (widget.value == oldWidget.value) {
      return;
    }
    controller.forward();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = widget.theme;
    final isF = widget.isForward;

    final offsetAnimation = Tween<Offset>(
      begin: isF ? const Offset(0, -1) : Offset.zero,
      end: isF ? Offset.zero : const Offset(0, -1),
    ).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0, 1, curve: Curves.easeInOutQuint),
    ));

    offsetAnimation.addListener(() {
      if (controller.isCompleted) {
        setState(() {
          oldValue = widget.value;
          controller.value = 0;
        });
      }
    });

    return Container(
      height: _segmentHeight,
      width: widget.width,
      alignment: widget.alignment,
      child: Stack(children: [
        SlideTransition(
            position: offsetAnimation,
            child: Container(
              height: _segmentHeight,
              width: widget.width,
              alignment: widget.alignment,
              child: Text(
                isF ? widget.value : oldValue,
                textAlign: TextAlign.right,
                style: style,
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            )),
        Positioned(
          top: _segmentHeight,
          child: SlideTransition(
              position: offsetAnimation,
              child: Container(
                height: _segmentHeight,
                width: widget.width,
                alignment: widget.alignment,
                child: Text(
                  isF ? oldValue : widget.value,
                  textAlign: widget.alignment == Alignment.centerLeft ? TextAlign.left : TextAlign.right,
                  style: style,
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              )),
        ),
      ]),
    );
  }
}
