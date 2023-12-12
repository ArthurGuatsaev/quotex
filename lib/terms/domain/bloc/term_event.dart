// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'term_bloc.dart';

abstract class TermsEvent {}

class GetTermsModelEvent extends TermsEvent {}

class GetHistoryTermEvent extends TermsEvent {}

class GetHistoryFirstEvent extends TermsEvent {}

class StartTestEvent extends TermsEvent {}

class StopTestEvent extends TermsEvent {}

class AgainTermEvent extends TermsEvent {}

class ResetTestEvent extends TermsEvent {}

class CountIncrementEvent extends TermsEvent {}

class GetTestCountEvent extends TermsEvent {}

class ResetFavoriteEvent extends TermsEvent {}

class ChangIndexActiveTermsEvent extends TermsEvent {
  final bool rem;
  ChangIndexActiveTermsEvent({
    required this.rem,
  });
}

class AddAnswearEvent extends TermsEvent {
  final VTestResult result;
  AddAnswearEvent({
    required this.result,
  });
}

class SkipQuestionEvent extends TermsEvent {
  final int time;
  SkipQuestionEvent({
    required this.time,
  });
}

class ChangeActiveTermsEvent extends TermsEvent {
  final String category;
  ChangeActiveTermsEvent({
    required this.category,
  });
}

class MixedTermsEvent extends TermsEvent {
  final String category;
  MixedTermsEvent({required this.category});
}

class AddCustomTermsDate extends TermsEvent {
  final DateTime date;
  AddCustomTermsDate({required this.date});
}

class ChangeTestTimeEvent extends TermsEvent {
  final int duration;
  ChangeTestTimeEvent({required this.duration});
}

class ChangeTestEntityEvent extends TermsEvent {
  final int entity;
  ChangeTestEntityEvent({required this.entity});
}

class RememberedTermEvent extends TermsEvent {
  final TermsModel term;
  RememberedTermEvent({required this.term});
}

class AddFavorTermEvent extends TermsEvent {
  final TermsModel term;
  AddFavorTermEvent({required this.term});
}

class RemoveFavoriteEvent extends TermsEvent {
  final TermsModel term;
  RemoveFavoriteEvent({required this.term});
}

class ChangeLastTermEvent extends TermsEvent {
  final TermsModel term;
  ChangeLastTermEvent({required this.term});
}
