import 'package:flutter/material.dart';
import 'package:flutter_application_cryptoapi/util/helpers/text_styles.dart';

class OpenCloseContainer extends StatelessWidget {
  final double high;
  final double low;
  final double open;
  final double close;
  const OpenCloseContainer({super.key, required this.high, required this.low, required this.open, required this.close});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left:20.0, right: 20.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Column(children: [
          Column(
           children: [
             Row(children: [const Text("HIGH: ", style:FontTextStyle.textStyle2), Text('$high', style:FontTextStyle.textStyle1)],),
             Row(children: [const Text("LOW:  ", style:FontTextStyle.textStyle2), Text('$low', style:FontTextStyle.textStyle1)],),
           ],
         )],),
         Column(children: [
             Row(children: [const Text("OPEN: ", style:FontTextStyle.textStyle2,), Text('$open', style:FontTextStyle.textStyle1)],),
             Row(children: [const Text("CLOSE:  ",style:FontTextStyle.textStyle2,), Text('$close', style:FontTextStyle.textStyle1)],),
    
         ],)],
      ),
    );
  }
}
