part of 'term_bloc.dart';

class TermsState {
  final TermsViewModel model;
  final int count;
  final DateTime? date;
  final List<TermsModel> termForDate;
  const TermsState({
    required this.model,
    this.termForDate = const [],
    this.date,
    this.count = 0,
  });

  TermsState copyWith({
    TermsViewModel? model,
    DateTime? date,
    int? count,
    List<TermsModel>? termForDate,
  }) {
    return TermsState(
        model: model ?? this.model,
        date: date ?? this.date,
        termForDate: termForDate ?? this.termForDate,
        count: count ?? this.count);
  }
}
