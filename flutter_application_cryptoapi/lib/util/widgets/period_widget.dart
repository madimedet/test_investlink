import 'package:flutter/material.dart';

class PeriodButton extends StatelessWidget {
  final String period;
  final Color choiseColor;
  final Function? function;
  const PeriodButton(
      {super.key, required this.period, required this.choiseColor,  this.function});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
       style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Custom color
  ),
      onPressed: (){function;}
    
      ,
      child: Container(
        height: 35,
        width: 40,
        color: choiseColor,
        child: Center(
          child: Text(period),
        ),
      ),
    );
  }
}
