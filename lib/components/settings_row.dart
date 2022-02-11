// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SettingsRow extends StatefulWidget {
  String mainText;
  String secondaryText;
  bool secondaryTextTrue;
  bool toggleButton;

  SettingsRow({Key? key, required this.mainText,required this.secondaryText, required this.secondaryTextTrue, required this.toggleButton}) : super(key: key);

  @override
  _SettingsRowState createState() => _SettingsRowState();
}

class _SettingsRowState extends State<SettingsRow> {
  bool _toggleSwitchState = true;

  @override
  Widget build(BuildContext context) {
      return InkWell(
        onTap: () {
          if (widget.toggleButton) {
            setState(() {
              _toggleSwitchState = !_toggleSwitchState;
            });
          } else {
            return;
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: (widget.toggleButton) ? 15 : 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.mainText,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Visibility(
                        visible: widget.secondaryTextTrue,
                        child: Text(
                          widget.secondaryText,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: widget.toggleButton,
                    child: Switch(
                      value: _toggleSwitchState,
                      onChanged: (bool newValue) {
                        setState(() {
                          _toggleSwitchState = !_toggleSwitchState;
                        });
                      },
                      activeColor: Colors.blue,
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 3,
              color: Colors.grey,
            )
          ],
        ),
      );
  }
}
