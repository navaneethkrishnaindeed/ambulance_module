import 'package:flutter/material.dart';

class KeyboardKey extends StatefulWidget {
  final dynamic label;
  final dynamic value;
  final ValueSetter<dynamic> onTap;
  final ValueSetter<dynamic> onLongPressed;

  KeyboardKey({
    required this.label,
    required this.value,
    required this.onTap,
    required this.onLongPressed
  });

  @override
  _KeyboardKeyState createState() => _KeyboardKeyState();
}

class _KeyboardKeyState extends State<KeyboardKey> {

  renderLabel(){
    if(widget.label is Widget){
      return widget.label;
    }

    return Text(
      widget.label,
      style:const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
 bool orientation(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        widget.onLongPressed(widget.value);
      },
      onTap: (){
        widget.onTap(widget.value);
      },
      child: AspectRatio(
          aspectRatio:orientation(context)?5:2.1, 
          child:Center(
              child: renderLabel(),
            
          ),
        ),
    
    );
  }
}