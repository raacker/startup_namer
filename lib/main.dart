import "package:flutter/material.dart";
import "screen/name_list.dart";

void main() => runApp(NameGenerator());

class NameGenerator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Startup Name Generator",
      home: NameList(),
      debugShowCheckedModeBanner: false,
    );
  }
}