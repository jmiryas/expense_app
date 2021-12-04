import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';

import '../enum/expense_type.dart';
import '../enum/category_type.dart';
import '../models/money_model.dart';
import '../bloc/expense/expense_bloc.dart';
import '../widgets/alert_add_expense_widget.dart';

class ExpenseWidget extends StatelessWidget {
  final Map<String, List<Map>> expenseMapList;
  final String selectedExpenseDate;

  const ExpenseWidget({
    Key? key,
    required this.expenseMapList,
    required this.selectedExpenseDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return expenseMapList[selectedExpenseDate]!.isEmpty
        ? const Center(
            child: Text("Pengeluaran masih kosong."),
          )
        : GroupedListView<dynamic, String>(
            elements: expenseMapList[selectedExpenseDate]!,
            groupBy: (item) => item["dateTime"],
            groupComparator: (value1, value2) => value2.compareTo(value1),
            itemComparator: (item1, item2) =>
                item1["label"].compareTo(item2["label"]),
            order: GroupedListOrder.ASC,
            groupSeparatorBuilder: (String value) => Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
              child: Container(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                child: Text(
                  value,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            itemBuilder: (c, item) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Card(
                  child: ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 8.0,
                          backgroundColor:
                              getCategoryColor(item["categoryType"]),
                        )
                      ],
                    ),
                    title: Text(
                      item["label"],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(item["dateTime"]),
                    trailing: Text(
                      "Rp ${getMoneyFormatted(item['money'])}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext newContext) {
                            return AlertDialog(
                              title: const Text(
                                "Edit?",
                                textAlign: TextAlign.center,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(newContext, "Cancel"),
                                  child: const Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertAddExpenseWidget(
                                        money: MoneyModel.fromJson(item),
                                        expenseType: ExpenseType.edit,
                                      ),
                                    ).whenComplete(
                                        () => Navigator.pop(newContext, "OK"));
                                  },
                                  child: const Text("OK"),
                                ),
                              ],
                            );
                          });
                    },
                    onLongPress: () {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext newContext) {
                            return AlertDialog(
                              title: const Text(
                                "Hapus?",
                                textAlign: TextAlign.center,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(newContext, "Cancel"),
                                  child: const Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    BlocProvider.of<ExpenseBloc>(context).add(
                                      ExpenseDeleteExpenseEvent(
                                        money: MoneyModel.fromJson(item),
                                      ),
                                    );

                                    Navigator.pop(newContext, "OK");
                                  },
                                  child: const Text("OK"),
                                ),
                              ],
                            );
                          });
                    },
                  ),
                ),
              );
            },
          );
  }
}
