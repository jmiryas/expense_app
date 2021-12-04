part of 'expense_bloc.dart';

abstract class ExpenseEvent extends Equatable {
  const ExpenseEvent();

  @override
  List<Object> get props => [];
}

class ExpenseStartedEvent extends ExpenseEvent {}

// Menambah pengeluaran

class ExpenseAddNewEvent extends ExpenseEvent {
  final MoneyModel money;

  const ExpenseAddNewEvent({required this.money});

  @override
  List<Object> get props => [money];
}

// Edit pengeluaran

class ExpenseEditExpenseEvent extends ExpenseEvent {
  final String id;
  final MoneyModel newMoney;

  const ExpenseEditExpenseEvent({
    required this.id,
    required this.newMoney,
  });

  @override
  List<Object> get props => [
        id,
        newMoney,
      ];
}

// Menghapus expense

class ExpenseDeleteExpenseEvent extends ExpenseEvent {
  final MoneyModel money;

  const ExpenseDeleteExpenseEvent({required this.money});

  @override
  List<Object> get props => [money];
}

// Ganti selected date

class ExpenseChangeSelectedDateEvent extends ExpenseEvent {
  final String selectedDate;

  const ExpenseChangeSelectedDateEvent({required this.selectedDate});

  @override
  List<Object> get props => [selectedDate];
}

class ExpenseErrorEvent extends ExpenseEvent {
  final Object error;

  const ExpenseErrorEvent({required this.error});

  @override
  List<Object> get props => [error];
}
