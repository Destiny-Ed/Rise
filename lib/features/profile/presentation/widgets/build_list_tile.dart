import 'package:flutter/material.dart';

Widget buildListTile({
  required IconData icon,
  required String title,
  Widget? trailing,
  VoidCallback? onTap,
  Color? titleColor,
}) {
  return ListTile(
    leading: Icon(icon),
    title: Text(title, style: TextStyle(color: titleColor ?? Colors.black)),
    trailing: trailing,
    onTap: onTap,
  );
}
