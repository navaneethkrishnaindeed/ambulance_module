import 'dart:developer';

import 'package:ambulance_module/domain/DS_Version3/DS_text/DS_text_styles.dart';
import 'package:ambulance_module/domain/utils/screen_sizes.dart';
import 'package:flutter/material.dart';

import 'keyboard_key.dart';

class CustomKeyboard extends StatefulWidget {
  final String label;
  final ValueNotifier valueNotfier;
  final bool isObscure;
  const CustomKeyboard({
    required this.label,
    required this.valueNotfier,
    required this.isObscure
  });
  @override
  _CustomKeyboardState createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  late final List<List<dynamic>> keys;
  late final List<List<dynamic>> upperKeys;
  bool isUpperCaseEnabled = false;

  late String amount;

  @override
  void initState() {
    super.initState();

    keys = [
      ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'],
      ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'],
      ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l'],
      ['', 'z', 'x', 'c', 'v', 'b', 'n', 'm', ''],
      ['ABC', '@', "Space", const Icon(Icons.keyboard_backspace)],
    ];

    upperKeys = [
      ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'],
      ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
      ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
      ['', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', ''],
      ['ABC', '@', "Space", const Icon(Icons.keyboard_backspace)],
    ];
    amount = '';
  }

  bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.longestSide >= 970;
  }

  onKeyTap(val) {
    if (val == '0' && amount.length == 0) {
      return;
    }

    setState(() {
      amount = amount + val;
    });
  }

  onBackspacePress() {
    if (amount.length == 0) {
      return;
    }

    setState(() {
      amount = amount.substring(0, amount.length - 1);
    });
  }

  clearAll() {
    setState(() {
      amount = "";
    });
  }

  // allocateSpace(dynamic y) {
  //   if (y == 'Space') {
  //     return ScreenSizes(context).screenWidthFraction(percent: 70);
  //   } else if (y == '@' || y == 'ABC') {
  //     return ScreenSizes(context).screenWidthFraction(percent: 7);
  //   } else if (y is Widget) {
  //     return ScreenSizes(context).screenWidthFraction(percent: 13);
  //   } else {
  //     return ScreenSizes(context).screenWidthFraction(percent: 9);
  //   }
  // }

  // renderKeyboard() {
  //   return isUpperCaseEnabled
  //       ? upperKeys.map((x) {
  //           return Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: x.map(
  //               (y) {
  //                 return Container(
  //                   margin: const EdgeInsets.all(2),
  //                   decoration: BoxDecoration(
  //                       color: setColor(y),
  //                       // color: Colors.green,
  //                       // border: y != '' ? Border.all() : null,
  //                       borderRadius: BorderRadius.circular(15),
  //                       boxShadow: y != ''
  //                           ? const [
  //                               BoxShadow(
  //                                   blurRadius: 4,
  //                                   color: Colors.black38,
  //                                   offset: Offset(-1, 2))
  //                             ]
  //                           : null),
  //                   width: allocateSpace(y),
  //                   height: 55,
  //                   child: KeyboardKey(
  //                     isCaps: isUpperCaseEnabled,
  //                     label: y,
  //                     value: y,
  //                     onLongPressed: (value) => clearAll(),
  //                     onTap: (val) {
  //                       if (val is Widget) {
  //                         onBackspacePress();
  //                       } else if (val == "Space") {
  //                         onKeyTap(" ");
  //                       } else if (val == "ABC") {
  //                         setState(() {
  //                           isUpperCaseEnabled = !isUpperCaseEnabled;
  //                         });
  //                       } else {
  //                         onKeyTap(val);
  //                       }
  //                     },
  //                   ),
  //                 );
  //               },
  //             ).toList(),
  //           );
  //         }).toList()
  //       : keys.map((x) {
  //           return Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: x.map(
  //               (y) {
  //                 return Container(
  //                   margin: const EdgeInsets.all(2),
  //                   decoration: BoxDecoration(
  //                       color: setColor(y),
  //                       // border: y != '' ? Border.all() : null,
  //                       borderRadius: BorderRadius.circular(15),
  //                       boxShadow: y != ''
  //                           ? const [
  //                               BoxShadow(
  //                                   blurRadius: 4,
  //                                   color: Colors.black38,
  //                                   offset: Offset(-1, 2))
  //                             ]
  //                           : null),
  //                   width: allocateSpace(y),
  //                   height: 55,
  //                   child: KeyboardKey(
  //                     isCaps: isUpperCaseEnabled,
  //                     label: y,
  //                     value: y,
  //                     onLongPressed: (value) => clearAll(),
  //                     onTap: (val) {
  //                       if (val is Widget) {
  //                         onBackspacePress();
  //                       } else if (val == "Space") {
  //                         onKeyTap(" ");
  //                       } else if (val == "ABC") {
  //                         setState(() {
  //                           isUpperCaseEnabled = !isUpperCaseEnabled;
  //                         });
  //                       } else {
  //                         onKeyTap(val);
  //                       }
  //                     },
  //                   ),
  //                 );
  //               },
  //             ).toList(),
  //           );
  //         }).toList();
  // }

  Color? setColor(y) {
    if (y == 'ABC' && isUpperCaseEnabled == true) {
      return Colors.green;
    } else if (y != '') {
      return Colors.white;
    } else {
      return null;
    }
  }

  renderAmount() {
    String display = 'Enter ${widget.label}';
    TextStyle style = DS_Style_QuickSand.params(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      textColor: Colors.grey,
      // letterSpacing: widget.isObscure?6:null
    );

    if (this.amount.length > 0) {
      TextStyle style2 =  TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        letterSpacing: widget.isObscure?8:null
      );

      display = widget.isObscure ? maskAmount(amount, amount.length) : amount;
      style = style2;
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
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: amount.isNotEmpty
                      ? () {
                          widget.valueNotfier.value = amount;

                          Navigator.of(context).pop();
                        }
                      : null,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: amount.isNotEmpty ? Colors.green : Colors.white,
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
            ],
          ),
        ],
      ),
    );
  }
  String maskAmount(String amountString, int targetLength) {
    String maskedAmount = '*' * amountString.length;
    return maskedAmount;
  }
  @override
  Widget build(BuildContext context) {
    allocateSpace(dynamic y) {
      if (y == 'Space') {
        if (isTablet(context)) {
          return ScreenSizes(context).screenWidthFraction(percent: 66);
        } else {
          return ScreenSizes(context).screenWidthFraction(percent: 45);
        }
      } else if (y == '@' ) {
        if (isTablet(context)) {
          return ScreenSizes(context).screenWidthFraction(percent: 7);
        } else {
          return ScreenSizes(context).screenWidthFraction(percent: 13);
        }
      }else if( y == 'ABC'){
         if (isTablet(context)) {
          return ScreenSizes(context).screenWidthFraction(percent: 10);
        } else {
          return ScreenSizes(context).screenWidthFraction(percent: 13);
        }
      } else if (y is Widget) {
        if (isTablet(context)) {
          return ScreenSizes(context).screenWidthFraction(percent: 13);
        } else {
          return ScreenSizes(context).screenWidthFraction(percent: 20);
        }
      } else {
        if (isTablet(context)) {
          return ScreenSizes(context).screenWidthFraction(percent: 9);
        } else {
          return ScreenSizes(context).screenWidthFraction(percent: 8.8);
        }
      }
    }

    
  bool isLandScape(BuildContext context){
    return MediaQuery.of(context).orientation==Orientation.landscape;
  }


    renderKeyboard() {
      return isUpperCaseEnabled
          ? upperKeys.map((x) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: x.map(
                  (y) {
                    return Container(
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: setColor(y),
                          // color: Colors.green,
                          // border: y != '' ? Border.all() : null,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: y != ''
                              ? const [
                                  BoxShadow(
                                    blurRadius: 1,
                                      color: Color.fromARGB(55, 0, 0, 0),
                                      offset: Offset(-1, 2),
                                      )
                                ]
                              : null),
                      width: allocateSpace(y),
                      height: isTablet(context) ? isLandScape(context)?45: 55 : 46,
                      child: KeyboardKey(
                        isCaps: isUpperCaseEnabled,
                        label: y,
                        value: y,
                        onLongPressed: (value) => clearAll(),
                        onTap: (val) {
                          if (val is Widget) {
                            onBackspacePress();
                          } else if (val == "Space") {
                            onKeyTap(" ");
                          } else if (val == "ABC") {
                            setState(() {
                              isUpperCaseEnabled = !isUpperCaseEnabled;
                            });
                          } else {
                            onKeyTap(val);
                          }
                        },
                      ),
                    );
                  },
                ).toList(),
              );
            }).toList()
          : keys.map((x) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: x.map(
                  (y) {
                    return Container(
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: setColor(y),
                          // border: y != '' ? Border.all() : null,
                          borderRadius:
                              BorderRadius.circular(isTablet(context) ? 15 : 5),
                          boxShadow: y != ''
                              ? const [
                                  BoxShadow(
                                      blurRadius: 1,
                                      color: Color.fromARGB(55, 0, 0, 0),
                                      offset: Offset(-1, 2),
                                      )
                                ]
                              : null),
                      width: allocateSpace(y),
                      height: isTablet(context) ? isLandScape(context)?45: 55 : 46,
                      child: KeyboardKey(
                        isCaps: isUpperCaseEnabled,
                        label: y,
                        value: y,
                        onLongPressed: (value) => clearAll(),
                        onTap: (val) {
                          if (val is Widget) {
                            onBackspacePress();
                          } else if (val == "Space") {
                            onKeyTap(" ");
                          } else if (val == "ABC") {
                            setState(() {
                              isUpperCaseEnabled = !isUpperCaseEnabled;
                            });
                          } else {
                            onKeyTap(val);
                          }
                        },
                      ),
                    );
                  },
                ).toList(),
              );
            }).toList();
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            renderAmount(),
            ...renderKeyboard(),
            renderConfirmButton(),
          ],
        ),
      ),
    );
  }
}
