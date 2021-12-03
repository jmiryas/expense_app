import 'package:flutter/material.dart';

import '../data/data.dart';

class ExpenseCategoryScreen extends StatelessWidget {
  const ExpenseCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Kategori Pengeluaran"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: expenseCategoryList.map((item) {
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  item.title,
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
                    color: item.color,
                  ),
                ),
              ),
              child: Text(
                item.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  letterSpacing: 0.5,
                  fontSize: 16.0,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
