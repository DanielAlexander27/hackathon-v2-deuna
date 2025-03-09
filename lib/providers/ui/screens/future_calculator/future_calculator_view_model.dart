import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'future_calculator_view_model.g.dart';

@riverpod
class FutureCalculatorViewModel extends _$FutureCalculatorViewModel {
  @override
  FutureCalculatorUiState? build() {
    return null;
  }

  void calculate(
    double initialBalance,
    double monthlyDeposit,
    double annualInterestPercentage,
    int yearsDuration,
  ) {
    double quantity = initialBalance;
    double interestEarnedTotal = 0;

    for (int i = 0; i < yearsDuration; i++) {
      quantity += monthlyDeposit * 12;
      double interestEarned = quantity * (annualInterestPercentage / 100);
      quantity += interestEarned;
      interestEarnedTotal += interestEarned;
    }

    state = FutureCalculatorUiState(
      total: quantity,
      initialBalance: initialBalance,
      monthlyDepositTotal: monthlyDeposit * 12 * yearsDuration,
      interestEarned: interestEarnedTotal,
    );
  }
}

class FutureCalculatorUiState {
  final double initialBalance;
  final double interestEarned;
  final double monthlyDepositTotal;
  final double total;

  FutureCalculatorUiState({
    required this.total,
    required this.initialBalance,
    required this.interestEarned,
    required this.monthlyDepositTotal,
  });
}
