import 'package:flutter/material.dart';
class CustomButton extends StatefulWidget {
  CustomButton({this.value, this.question});

  final String value;
  final String question;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return
 /*
      Wrap(
        children: <Widget>[
          Text('radio'),
          Radio(
            groupValue: 1,
            onChanged: (value){},
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          )
        ],
        crossAxisAlignment: WrapCrossAlignment.center,
      );

  */
      /*Material(
               child: ListTile(
            leading: Text(widget.value),
            title: Text(widget.question,
          ))); */
      Radio(
        value: widget.value,
        groupValue: 1,
        activeColor: Colors.green,
        onChanged: (val) {
          print("Radio vale works");
        },
      );



  }
}


