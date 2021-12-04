import 'package:flutter/material.dart';

class ExplanationWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  const ExplanationWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              letterSpacing: 1.2,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
        ],
      ),
      subtitle: Container(
        margin: const EdgeInsets.only(
          top: 5.0,
          bottom: 10.0,
        ),
        padding: const EdgeInsets.only(left: 8.0),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              width: 5.0,
              color: color,
            ),
          ),
        ),
        child: Text(
          subtitle,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            letterSpacing: 0.5,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
