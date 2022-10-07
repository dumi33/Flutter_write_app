import 'package:flutter/material.dart';
import 'appbar.dart';

class PhotoCheck extends StatefulWidget {
  const PhotoCheck({super.key});

  @override
  State<PhotoCheck> createState() => _PhotoCheckState();
}

class _PhotoCheckState extends State<PhotoCheck> {
  @override
  Widget build(BuildContext context) {
    return Appbar();
  }
}
