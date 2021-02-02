import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tagarela/app/components/GestureAccessibility/OptionGesture.class.dart';
import 'package:tagarela/app/components/GestureTagarela/gesture_tagarela_widget.dart';
import 'package:tagarela/app/shared/models/tagarela.class.dart';

class GestureAccessibilityWidget extends StatefulWidget {
  final Widget child;
  final bool loopOption;
  final List<OptionGesture> options;
  final Function onTap;
  final Function onDoubleTap;
  final bool active;
  final String primarySpeak;
  final int initialOption;
  final Tagarela tagarela = Tagarela();

  GestureAccessibilityWidget({
    Key key,
    this.options,
    this.onTap,
    this.onDoubleTap,
    this.active,
    this.primarySpeak,
    this.child,
    this.loopOption = true,
    this.initialOption,
  }) : super(key: key);

  @override
  _GestureAccessibilityWidgetState createState() =>
      _GestureAccessibilityWidgetState();
}

class _GestureAccessibilityWidgetState
    extends State<GestureAccessibilityWidget> {
  int indexOpt;

  @override
  void initState() {
    super.initState();

    if (widget.active == null || !widget.active) return;
    if (widget.initialOption != null) indexOpt = widget.initialOption;
    if (widget.primarySpeak != null) widget.tagarela.speak(widget.primarySpeak);
  }

  @override
  Widget build(BuildContext context) {
    return GestureTagarelaWidget(
      child: widget.child,
      onHorizontalDrag: (direction) {
        if (!widget.active == null || !widget.active || widget.options == null)
          return;
        if (indexOpt == null)
          indexOpt = 0;
        else {
          if (direction == Direction.right) {
            if (indexOpt < widget.options.length - 1)
              indexOpt++;
            else if (widget.loopOption) indexOpt = 0;
          }
          if (direction == Direction.left) {
            if (indexOpt > 0)
              indexOpt--;
            else if (widget.loopOption) indexOpt = widget.options.length - 1;
          }
        }
        widget.tagarela.speak(widget.options[indexOpt].speak);
      },
      onTap: (position) {
        if (!widget.active == null || !widget.active) return;
        String repeat;
        if (widget.onTap != null) repeat = widget.onTap(position);
        if (repeat != null) widget.tagarela.speak(repeat);
      },
      onDoubleTap: () {
        if (!widget.active == null || !widget.active || widget.options == null)
          return;
        if (indexOpt != null) {
          if (widget.options[indexOpt].action != null) {
            String txt = widget.options[indexOpt].action();
            if (txt != null) widget.tagarela.speak(txt);
          }
          if (widget.options[indexOpt].navegateTo != null)
            Modular.to.pushNamed(widget.options[indexOpt].navegateTo);
          if (widget.onDoubleTap != null) {
            widget.onDoubleTap(indexOpt);
          }
        }
        if (widget.initialOption != null) {
          indexOpt = widget.initialOption;
        }
      },
      onLongPress: () {
        if (!widget.active == null || !widget.active) return;
        widget.tagarela.speak(widget.primarySpeak);
      },
    );
  }
}
