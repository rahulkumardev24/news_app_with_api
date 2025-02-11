import 'package:flutter/material.dart';

import '../constants/colors.dart';

class MyIconButton extends StatefulWidget {
  IconData buttonIcon;
  Color? buttonColor;
  VoidCallback onTap;
  Color? iconColor;

  MyIconButton(
      {super.key,
      this.buttonColor = Colors.black12,
      this.iconColor = Colors.white,
      required this.buttonIcon,
      required this.onTap});

  @override
  State<MyIconButton> createState() => _MyIconButtonState();
}

class _MyIconButtonState extends State<MyIconButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      elevation: 4,
      onPressed: widget.onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      backgroundColor: widget.buttonColor,
      child: Icon(
        widget.buttonIcon,
        size: 30,
        color: widget.iconColor,
      ),
    );
  }
}
