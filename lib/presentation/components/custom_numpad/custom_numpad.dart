// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:ambulance_module/domain/DS_Version3/DS_text/DS_text_styles.dart';
import 'package:flutter/material.dart';

import 'keyboard_key.dart';

// ignore: must_be_immutable
class CustomNumPad extends StatefulWidget {
  late final bool isObscure;
  late final int limit;
  late bool? isPhone;
  final String label;
  ValueNotifier valueNotfier;
  bool isFinite;
  Function? funct;


  CustomNumPad(
      {required this.isObscure,
      required this.limit,
      required this.label,
      required this.valueNotfier,
      required this.isFinite,
      this.isPhone,this.funct});

  @override
  _CustomNumPadState createState() => _CustomNumPadState();
}

class _CustomNumPadState extends State<CustomNumPad> {
  late final List<List<dynamic>> keys;
  late String amount;
  late String keyPin;

  @override
  void initState() {
    super.initState();

    keys = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['00', '0', const Icon(Icons.keyboard_backspace)],
    ];
  amount = '';
   
  }

  onKeyTap(val) {
    var set = "";
    if (val == '0' && amount.isEmpty) {
      return;
    } else if (amount.length == widget.limit) {
      setState(() {
        amount = set;
      });
    } else {
      setState(() {
        amount = amount + val;
        set = amount;
      });
    }
  }

  onBackspacePress() {
    if (amount.isEmpty) {
      return;
    }

    setState(() {
      amount = amount.substring(0, amount.length - 1);
    });
  }
  bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.longestSide >= 900;
  }


  renderKeyboard() {
    return keys
        .map(
          (x) => Row(
            children: x.map(
              (y) {
                return Expanded(
                  child: 

                    KeyboardKey(
                      label: y,
                      value: y,
                      onLongPressed: (value) {
                        clearAll();
                      },
                      onTap: (val) {
                        if (val is Widget) {
                          onBackspacePress();
                        }if(val=="Submit"){
                          widget.funct;
                        } else {
                          onKeyTap(val);
                        }
                      },
                    ),
                
                );
              },
            ).toList(),
          ),
        )
        .toList();
  }

  clearAll() {
    setState(() {
      amount = "";
    });
  }

  String maskAmount(String amountString, int targetLength) {
    String maskedAmount = '*' * amountString.length;
    return maskedAmount;
  }

  renderAmount() {
    String display = 'Enter the ${widget.label}';

    TextStyle style = DS_Style_QuickSand.params(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      textColor: Colors.grey,
    );

    if (amount.isNotEmpty) {
      TextStyle style2 = const TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          letterSpacing: 18);
      if (widget.isPhone == null || widget.isPhone == false) {
        keyPin = amount;
        display = widget.isObscure ? maskAmount(amount, amount.length) : amount;
        style = style2;
      } else if(widget.isPhone==true) {

        keyPin = amount;
      display = widget.isObscure ? maskAmount(amount, amount.length) : "+91 $amount";
      style =const TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          letterSpacing: 5);



        
      }
    }

    return Expanded(
      child: Center(
        child: Text(
          display,
          style: style,
        ),
      ),
    );
  }

  renderConfirmButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Expanded(
        child: InkWell(
          onTap: amount.isNotEmpty
                      ? ()async {
                          widget.valueNotfier.value = amount;
                         if(widget.isFinite&&amount.length == widget.limit){
                            widget.funct!();
                          Navigator.of(context).pop();
                          }
                        }
                      : null,
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: amount.isNotEmpty
                    ? (amount.length == widget.limit
                        ? Colors.green
                        :widget.isFinite?Colors.orange: Colors.green)
                    : Colors.white,
                borderRadius: BorderRadius.circular(15)),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Submit',
                style: DS_Style_QuickSand.params(
                    textColor:
                        amount.isNotEmpty ? Colors.white : Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            renderAmount(),
            ...renderKeyboard(),
            SizedBox(height: 18,),
            renderConfirmButton(),
          ],
        ),
      ),
    );
  }
}
