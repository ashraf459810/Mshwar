import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  final String chosenvalue;
  final String hint;
  final List<dynamic> list;
  final Function onchanged;
  DropDown({this.chosenvalue, this.hint, this.list, this.onchanged});

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String chosenvalue;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<dynamic>(
      isExpanded: true,
      underline: SizedBox(),
      hint: chosenvalue == null
          ? Center(child: Text(widget.hint))
          : Center(child: Text(chosenvalue)),
      items: widget.list.map((dynamic value) {
        return DropdownMenuItem<dynamic>(
          value: value,
          child: Center(child: new Text(value)),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          widget.onchanged(value);
          chosenvalue = value;
        });
      },
    );
  }
}
