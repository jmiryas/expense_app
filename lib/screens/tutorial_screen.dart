import 'package:flutter/material.dart';

import '../data/data.dart';
import '../widgets/explanation_widget.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Tutorial Aplikasi"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: tutorialList.map((item) {
          return ExplanationWidget(
            title: item.title,
            subtitle: item.subtitle,
            color: item.color,
          );
        }).toList(),
      ),
    );
  }
}
