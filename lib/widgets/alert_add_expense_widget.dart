import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/data.dart';
import '../enum/expense_type.dart';
import '../enum/category_type.dart';
import '../models/money_model.dart';
import '../bloc/expense/expense_bloc.dart';

class AlertAddExpenseWidget extends StatelessWidget {
  final MoneyModel? money;
  final ExpenseType? expenseType;
  const AlertAddExpenseWidget({
    Key? key,
    this.money,
    this.expenseType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _expenseName = TextEditingController();
    String _selectedCategory = categoryTypeList[0];
    TextEditingController _expenseTotal = TextEditingController();
    DateTime _selectedDate = DateTime.now();

    if (expenseType == ExpenseType.edit) {
      _expenseName.text = money!.label;
      _selectedCategory = getCategoryTypeString(money!.categoryType);
      _expenseTotal.text = money!.money.toString();
      _selectedDate = DateTime.parse(money!.dateTime);
    }

    const _uuid = Uuid();

    return AlertDialog(
      title: const Text("Tambah Pengeluaran"),
      content: StatefulBuilder(builder: (context, setState) {
        return SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _expenseName,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  labelText: "Nama Pengeluaran",
                ),
              ),
              DropdownButton<String>(
                value: _selectedCategory,
                isExpanded: true,
                itemHeight: 70.0,
                underline: Container(
                  height: 1,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue!;
                  });
                },
                items: categoryTypeList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              TextField(
                controller: _expenseTotal,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Banyak Pengeluaran",
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                child: ListTile(
                  title: const Text("Pilih Tanggal"),
                  subtitle: Text(_selectedDate.toString()),
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2121),
                    );

                    if (picked != null && picked != _selectedDate) {
                      setState(() {
                        _selectedDate = picked;
                      });
                    }
                  },
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, "Cancel"),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            // Jika kosong, tampilkan alert.
            // Jika diisi, buat pengeluaran baru.

            if (_expenseName.text.isEmpty ||
                _expenseTotal.text.isEmpty ||
                _selectedCategory.isEmpty ||
                _selectedDate.toString().isEmpty) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        "Error",
                        textAlign: TextAlign.center,
                      ),
                      content: const Text("Tidak boleh ada yang kosong!"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  });
            } else {
              if (expenseType == ExpenseType.edit) {
                MoneyModel newMoney = MoneyModel(
                  label: _expenseName.text,
                  money: double.parse(_expenseTotal.text),
                  categoryType: getCategoryType(_selectedCategory),
                  dateTime: _selectedDate.toString().substring(0, 10),
                );

                BlocProvider.of<ExpenseBloc>(context).add(
                    ExpenseEditExpenseEvent(
                        id: money!.id!, newMoney: newMoney));
              } else {
                MoneyModel newMoney = MoneyModel(
                  id: _uuid.v4(),
                  label: _expenseName.text,
                  money: double.parse(_expenseTotal.text),
                  categoryType: getCategoryType(_selectedCategory),
                  dateTime: _selectedDate.toString().substring(0, 10),
                );

                BlocProvider.of<ExpenseBloc>(context)
                    .add(ExpenseAddNewEvent(money: newMoney));
              }

              Navigator.of(context).pop();
            }
          },
          child: const Text("OK"),
        ),
      ],
    );
  }
}
