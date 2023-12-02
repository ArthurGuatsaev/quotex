// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:quotex/lessons/domain/model/lesson.dart';

enum SortLevel { all, begin, advanced }

class LessonViewModel extends Equatable {
  final List<Lesson> lessons;
  final Lesson? current;
  final SortLevel sort;
  const LessonViewModel(
      {this.lessons = const [], this.current, this.sort = SortLevel.all});

  @override
  List<Object?> get props => [lessons, current, sort];

  LessonViewModel copyWith(
      {List<Lesson>? lessons, Lesson? current, SortLevel? sort}) {
    return LessonViewModel(
        lessons: lessons ?? this.lessons,
        current: current ?? this.current,
        sort: sort ?? this.sort);
  }

  List<Lesson> get sortedList {
    switch (sort) {
      case SortLevel.all:
        return lessons;
      case SortLevel.advanced:
        return lessons.where((element) => element.level == 'Advanced').toList();
      case SortLevel.begin:
        return lessons
            .where((element) => element.level == 'Beginners')
            .toList();
    }
  }

  List<Lesson> get startedLessons {
    return lessons
        .where((element) => element.status == LessonStatus.started)
        .toList();
  }

  List<Lesson> get finishedLessons {
    return lessons
        .where((element) => element.status == LessonStatus.finished)
        .toList();
  }

  List<Lesson> get favoriteLessons {
    final x = lessons.where((element) => element.isFavorite == true).toList();
    return x;
  }

  LessonViewModel setCurrentLesson(Lesson lesson) {
    return copyWith(current: lesson);
  }

  LessonViewModel getSaveHistory(List<Lesson> history) {
    return copyWith(lessons: history);
  }

  LessonViewModel getLessons(List<Lesson> lessons) {
    return copyWith(lessons: lessons);
  }

  LessonViewModel finishedLesson(
      {required List<Lesson> lessons, required Lesson lesson}) {
    return copyWith(lessons: lessons, current: lesson);
  }

  LessonViewModel startedLesson(List<Lesson> lessons) {
    return copyWith(lessons: lessons);
  }

  LessonViewModel favorLesson(List<Lesson> lessons) {
    return copyWith(lessons: lessons);
  }
}
