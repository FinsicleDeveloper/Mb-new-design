

import 'package:flutter/material.dart';

Container con(Widget child) {
  return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          const BoxShadow(
              color: Colors.black,
              offset: Offset(5, 5),
              spreadRadius: 5,
              blurRadius: 15),
          BoxShadow(
              color: Colors.grey.shade800,
              offset: const Offset(-4, -4),
              spreadRadius: 1,
              blurRadius: 15),
        ],
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, Colors.black],
            stops: [0, 1]),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: child,
      ));
}