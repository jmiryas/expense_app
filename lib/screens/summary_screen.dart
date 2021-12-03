import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/data.dart';
import '../enum/category_type.dart';
import '../models/money_model.dart';
import '../bloc/expense/expense_bloc.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ringkasan Pengeluaran"),
        centerTitle: true,
      ),
      body: BlocBuilder<ExpenseBloc, ExpenseState>(builder: (context, state) {
        if (state is ExpenseLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ExpenseLoadedState) {
          if (state.expenseMapList.isEmpty &&
              state.selectedExpenseDate.isEmpty) {
            return const Center(
              child: Text("Pengeluaran masih kosong."),
            );
          } else {
            // Membuat map untuk menampung semua kategori,
            // kemudian set value awal menjadi 0.0;
            // Tambahkan semua money sesuai kategori.
            // Terakhir dapatkan total.

            final Map<String, double> currentExpenseTotal = {};
            final Map<String, double> totalExpense = {"Total": 0.0};

            for (var item in categoryTypeList) {
              currentExpenseTotal[item] = 0.0;
            }

            for (var item in state.expenseMapList[state.selectedExpenseDate]!) {
              final category = getCategoryTypeString(item["categoryType"]);

              currentExpenseTotal[category] =
                  currentExpenseTotal[category]! + item["money"];

              totalExpense["Total"] = totalExpense["Total"]! + item["money"];
            }

            return ListView(
              padding: const EdgeInsets.all(20.0),
              children: [
                Text(
                  "Ringkasan pengeluaran bulan ${getDateTimeString(state.selectedExpenseDate)}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                ...currentExpenseTotal.entries.map((item) {
                  return ExpenseCardWidget(
                      label: item.key,
                      money: item.value,
                      color: getCategoryColor(getCategoryType(item.key)));
                }).toList(),
                ...totalExpense.entries.map((item) {
                  return ExpenseCardWidget(
                      label: item.key,
                      money: item.value,
                      color: Colors.green.shade400);
                }).toList()
              ],
            );
          }
        }

        return const Center(
          child: Text("Something went wrong!"),
        );
      }),
    );
  }
}

class ExpenseCardWidget extends StatelessWidget {
  final String label;
  final double money;
  final Color color;

  const ExpenseCardWidget({
    Key? key,
    required this.label,
    required this.money,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 8.0,
          backgroundColor: color,
        ),
        title: Text(label),
        trailing: Text(
          "Rp ${getMoneyFormatted(money)}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
