import 'package:flutter/material.dart';

Widget buildLabel(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 5),
    child: Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
  );
}

Widget buildTextField(String hint, TextEditingController controller, IconData icon) {
  return TextField(
    controller: controller,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.black54),
      prefixIcon: Icon(icon, color: Colors.black54),
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
    ),
  );
}

Widget buildDropdown(List<String> items, String hint, IconData icon, Function(String?) onChanged) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
    child: DropdownButtonFormField<String>(
      value: null,
      hint: Text(hint, style: TextStyle(color: Colors.black54)),
      dropdownColor: Colors.white,
      items:
          items.map((item) {
            return DropdownMenuItem(value: item, child: Text(item, style: TextStyle(color: Colors.black)));
          }).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(prefixIcon: Icon(icon, color: Colors.black54), border: InputBorder.none),
    ),
  );
}
