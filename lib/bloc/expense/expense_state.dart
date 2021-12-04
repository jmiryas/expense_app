part of 'expense_bloc.dart';

abstract class ExpenseState extends Equatable {
  const ExpenseState();

  @override
  List<Object> get props => [];
}

class ExpenseLoadingState extends ExpenseState {}

class ExpenseLoadedState extends ExpenseState {
  final Map<String, List<Map>> expenseMapList;
  final String selectedExpenseDate;

  const ExpenseLoadedState({
    this.expenseMapList = const {},
    this.selectedExpenseDate = "",
  });

  ExpenseLoadedState copyWith({
    Map<String, List<Map>>? newExpenseMapList,
    String? newSelectedExpenseDate,
  }) {
    return ExpenseLoadedState(
      expenseMapList: newExpenseMapList ?? expenseMapList,
      selectedExpenseDate: newSelectedExpenseDate ?? selectedExpenseDate,
    );
  }

  @override
  List<Object> get props => [expenseMapList, selectedExpenseDate];
}

class ExpenseErrorState extends ExpenseState {
  final Object error;

  const ExpenseErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
