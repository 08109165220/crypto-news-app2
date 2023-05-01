import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../notifications/view.dart';
Container cryptoappbar({
  required String name,
  required String description,
  required Icon icon,
}) {
  return Container(
    alignment: Alignment.bottomCenter,
    padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
    height: 170,
    decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xFFFEB800),Color(0xff000000)])),
    child: Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: GoogleFonts.actor(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(description,
                    style: TextStyle(fontSize: 16, color: Colors.black)),
              ],
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white.withOpacity(.3)),
                  child: IconButton(onPressed: () {}, icon: icon),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            )
          ],
        )
      ],
    ),
  );
}
