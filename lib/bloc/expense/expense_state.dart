part of 'expense_bloc.dart';

abstract class ExpenseState extends Equatable {
  const ExpenseState();

  @override
  List<Object> get props => [];
}

class ExpenseLoadingState extends ExpenseState {}

class ExpenseLoadedState extends ExpenseState {
  final Map<String, List<Map>> expenseMapList;
  final List<Map> expenseList;
  final String selectedExpenseDate;

  const ExpenseLoadedState({
    this.expenseMapList = const {},
    this.expenseList = const [],
    this.selectedExpenseDate = "",
  });

  ExpenseLoadedState copyWith({
    Map<String, List<Map>>? newExpenseMapList,
    List<Map>? newExpenseList,
    String? newSelectedExpenseDate,
  }) {
    return ExpenseLoadedState(
      expenseMapList: newExpenseMapList ?? expenseMapList,
      expenseList: newExpenseList ?? expenseList,
      selectedExpenseDate: newSelectedExpenseDate ?? selectedExpenseDate,
    );
  }

  @override
  List<Object> get props => [expenseMapList, expenseList, selectedExpenseDate];
}

class ExpenseErrorState extends ExpenseState {
  final Object error;

  const ExpenseErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
