import 'package:flutter/material.dart';

class SetterWithArrows extends StatefulWidget {
  int defaultVariable = 5;
  int defaultMin = 1;
  int defaultMax = 9;
  SetterWithArrows(
      {Key? key,
      required this.defaultVariable,
      required this.defaultMin,
      required this.defaultMax})
      : super(key: key);

  @override
  _SetterWithArrowsState createState() =>
      _SetterWithArrowsState(defaultVariable, defaultMin, defaultMax);
}

class _SetterWithArrowsState extends State<SetterWithArrows> {
  int value;
  int get _value => value;
  int min;
  int max;

  _SetterWithArrowsState(this.value, this.min, this.max);

  int getValue(){
    return this.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(

      children: [
        IconButton(
          icon: Icon(Icons.arrow_drop_up),
          onPressed: () {
            setState(() {
              if (value < max) {
                value++;
              }
            });
          },
        ),
        SizedBox(
            child: Text(
              value.toString(),
              textAlign: TextAlign.center,
            ),
            width: 20),
        IconButton(
          icon: Icon(Icons.arrow_drop_down),
          onPressed: () {
            setState(() {
              if (value > min) {
                value--;
              }
            });
          },
        ),
      ],
    ));
  }
}
