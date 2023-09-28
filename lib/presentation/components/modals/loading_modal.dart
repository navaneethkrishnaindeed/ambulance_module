import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../application/global/states.dart';

class LoadingModal extends StatefulWidget {
  const LoadingModal({super.key});

  @override
  State<LoadingModal> createState() => _LoadingModalState();
}

class _LoadingModalState extends State<LoadingModal> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: SizedBox(
            height: 160,
            
            child: FutureBuilder<LottieComposition>(
              future: Globalstates.composition,
              builder: (context, snapshot) => Lottie(composition: snapshot.data),
            ),
          ),
        ),
      ]),
    );
  }
}
