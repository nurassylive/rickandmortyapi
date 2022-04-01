import 'package:flutter/material.dart';

IconData genderIcon(String gender) {
  if (gender == 'Male') {
    return Icons.male;
  } else if (gender == 'Female') {
    return Icons.female;
  } else {
    return Icons.close;
  }
}
