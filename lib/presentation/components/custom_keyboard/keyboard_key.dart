import 'package:flutter/material.dart';

class KeyboardKey extends StatefulWidget {
  final dynamic label;
  final dynamic value;
  final ValueSetter<dynamic> onTap;
  final ValueSetter<dynamic> onLongPressed;
  final bool isCaps;

  KeyboardKey(
      {required this.label,
      required this.value,
      required this.onTap,
      required this.onLongPressed,required this.isCaps});

  @override
  _KeyboardKeyState createState() => _KeyboardKeyState();
}

class _KeyboardKeyState extends State<KeyboardKey> {

 bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.longestSide >= 900;
  }

  bool isLandScape(BuildContext context){
    return MediaQuery.of(context).orientation==Orientation.landscape;
  }

  renderLabel(BuildContext context) {
    
    if (widget.label is Widget) {
      return widget.label;
    }

    return Text(
      widget.label,
      style:  TextStyle(
        fontSize: isTablet(context)?20.0:22,
        fontWeight: FontWeight.w400,
        color: widget.isCaps==true&&widget.value=='ABC'?Colors.white:Colors.black
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        widget.onLongPressed(widget.value);
      },
      onTap: () {
        widget.onTap(widget.value);
      },

      // decoration:widget.value==''? null:BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10)),

      child: AspectRatio(
        aspectRatio:isLandScape(context)?4: 0.5,
        child: Center(
          child: renderLabel(context),
        ),
      ),
    );
  }
}
