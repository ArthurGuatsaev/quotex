// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'lesson_bloc.dart';

class LessonState {
  final LessonViewModel model;
  final int point;
  const LessonState({
    this.model = const LessonViewModel(),
    this.point = 0,
  });

  // @override
  // List<Object> get props => [model, point];

  LessonState copyWith({
    LessonViewModel? model,
    int? point,
  }) {
    return LessonState(
      model: model ?? this.model,
      point: point ?? this.point,
    );
  }
}
