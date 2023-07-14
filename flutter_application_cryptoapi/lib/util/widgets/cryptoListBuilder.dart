import 'package:flutter/material.dart';

class CryptoListBuilder extends StatefulWidget {
  final String nameTicker;
  final double cost;
  final double higth;
  final double low;
  const CryptoListBuilder(
      {super.key,
      required this.cost,
      required this.higth,
      required this.low,
      required this.nameTicker});

  @override
  State<CryptoListBuilder> createState() => _CryptoListBuilderState();
}

class _CryptoListBuilderState extends State<CryptoListBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.nameTicker.replaceFirst(RegExp(r'X:'), ''),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 60,),
            Text(
              widget.cost.toString(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 20),
            Column(
              children: [
                Text(widget.higth.toString()),
                Text(widget.low.toString())
              ],
            )
          ],
        ),
      ),
    );
  }
}
