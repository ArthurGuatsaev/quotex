part of 'term_bloc.dart';

class TermsState {
  final TermsViewModel model;
  final int count;
  const TermsState({
    required this.model,
    this.count = 0,
  });

  TermsState copyWith({
    TermsViewModel? model,
    int? count,
  }) {
    return TermsState(model: model ?? this.model, count: count ?? this.count);
  }
}
