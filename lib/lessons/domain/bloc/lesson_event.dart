part of 'lesson_bloc.dart';

abstract class LessonEvent extends Equatable {
  const LessonEvent();

  @override
  List<Object> get props => [];
}

class SaveLessonEvent extends LessonEvent {
  final Lesson lesson;
  const SaveLessonEvent({
    required this.lesson,
  });
}

class SetCurrentLessonEvent extends LessonEvent {
  final Lesson lesson;
  const SetCurrentLessonEvent({
    required this.lesson,
  });
}

class DeleteLessonEvent extends LessonEvent {
  final Lesson lesson;
  const DeleteLessonEvent({
    required this.lesson,
  });
}

class FinishedLessonEvent extends LessonEvent {
  final Lesson lesson;
  const FinishedLessonEvent({
    required this.lesson,
  });
}

class StartedLessonEvent extends LessonEvent {
  final Lesson lesson;
  const StartedLessonEvent({
    required this.lesson,
  });
}

class AddFavorLessonEvent extends LessonEvent {
  final Lesson lesson;
  const AddFavorLessonEvent({
    required this.lesson,
  });
}

class AddPointEvent extends LessonEvent {
  final int point;
  const AddPointEvent({
    required this.point,
  });
}

class ChangeSortEvent extends LessonEvent {
  final SortLevel sort;
  const ChangeSortEvent({
    required this.sort,
  });
}

class GetSaveLessonsEvent extends LessonEvent {}

class ResetAllDataEvent extends LessonEvent {}

class GetPointEvent extends LessonEvent {}

class GetLessonsEvent extends LessonEvent {}
