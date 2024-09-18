import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.color, this.isActive = false});

  final Color color;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundColor: kPrimaryColor,
              radius: 32,
              child: CircleAvatar(
                backgroundColor: color,
                radius: 28,
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundColor: color,
              radius: 32,
            ),
          );
  }
}