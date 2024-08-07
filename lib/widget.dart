import 'package:flutter/material.dart';

iconButton({required image, required ontap}) {
  return InkWell(
    onTap: ontap,
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    child: Image.asset(
      image,
      width: 22,
      color: Colors.white,
    ),
  );
}
