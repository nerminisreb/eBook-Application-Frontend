// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Clander extends StatefulWidget {
  @override
  State<Clander> createState() => _ClanderState();
}

class _ClanderState extends State<Clander> {
  DateTime _dateTime = DateTime.now();

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != _dateTime)
      setState(() {
        _dateTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(_dateTime == null
              ? 'Nothing has been picked yet'
              : _dateTime.toString()),
          RaisedButton(
            child: Text('Pick a date'),
            onPressed: () {
              _selectDate(context);
            },
          )
        ],
      ),
    );
  }
}
